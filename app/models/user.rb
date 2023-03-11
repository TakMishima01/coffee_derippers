class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_one_attached :image
  has_many :recipe_comments, dependent: :destroy
  has_many :my_recipes, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :name, presence: true
  validates :email, presence: true



  # ユーザー画像処理
  def get_user_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/cup_icon.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height], gravity: "center", crop: "100x100+0+0").processed
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest_user"
    end
  end

  # フォローしたとき
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  # フォローを外すとき
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  # フォロー状態の判定
  def following?(user)
    followings.include?(user)
  end

end
