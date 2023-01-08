class Recipe < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  enum roast: { light: 0, medium: 1, medium_dark: 2 }
  enum grind: { turkish: 0, fine: 1, medium_fine: 2, medium: 3, coarse: 4 }
end
