class Recipe < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :recipe_comments, dependent: :destroy
  has_many :my_recipes, dependent: :destroy

  enum roast: { light_roast: 0, medium_roast: 1, medium_dark_roast: 2 }
  enum grind: { turkish: 0, fine: 1, medium_fine: 2, medium: 3, coarse: 4 }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def add_my_recipe_by?(user)
    my_recipes.exists?(user_id: user.id)
  end

end
