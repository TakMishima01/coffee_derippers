class Relationship < ApplicationRecord
  # 分かりやすいようにuserをfollowerとfollowedに分ける
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
