class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  has_one_attached :image
  has_many :recipe_comments, dependent: :destroy

  def get_user_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/cup_icon.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height], gravity: "center", crop: "100x100+0+0").processed
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest_user"
    end
  end
end
