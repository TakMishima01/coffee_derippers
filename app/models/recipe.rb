class Recipe < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  enum roast: { light_roast: 0, medium_roast: 1, medium_dark_roast: 2 }
  enum grind: { turkish: 0, fine: 1, medium_fine: 2, medium: 3, coarse: 4 }
end
