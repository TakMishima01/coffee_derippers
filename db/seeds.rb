# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin = Admin.new(:email => "admin@example.com", :password => "adminadmin")
# admin.save!

users = User.create!(
  [
    {email:'john_doe@example.com', name: 'john_doe', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email:'jane_smith@example.com', name: 'jane_smith', password: 'testpassword' ,profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email:'mike_jones@example.com', name: 'mike_jones', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email:'sara_kim@example.com', name: 'sara_kim', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email:'david_lee@example.com', name: 'david_lee', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email:'mary_smith@example.com', name: 'mary_smith', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {email:'jason_kim@example.com', name: 'jason_kim', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    {email:'emily_wang@example.com', name: 'emily_wang', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")},
    {email:'peter_nguyen@example.com', name: 'peter_nguyen', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")},
    {email:'kevin_kang@example.com', name: 'kevin_kang', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")},
    {email:'stephanie_choi@example.com', name: 'stephanie_choi', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user11.jpg"), filename:"sample-user11.jpg")},
    {email:'jennifer_park@example.com', name: 'jennifer_park', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user12.jpg"), filename:"sample-user12.jpg")},
    {email:'joshua_lee@example.com', name: 'joshua_lee', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user13.jpg"), filename:"sample-user13.jpg")},
    {email:'kristen_kim@example.com', name: 'kristen_kim', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user14.jpg"), filename:"sample-user14.jpg")},
    {email:'benjamin_wong@example.com', name: 'benjamin_wong', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user15.jpg"), filename:"sample-user15.jpg")},
    {email:'rachel_kim@example.com', name: 'rachel_kim', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user16.jpg"), filename:"sample-user16.jpg")},
    {email:'andrew_lee@example.com', name: 'andrew_lee', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user17.jpg"), filename:"sample-user17.jpg")},
    {email:'lisa_wang@example.com', name: 'lisa_wang', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user18.jpg"), filename:"sample-user18.jpg")},
    {email:'samuel_kim@example.com', name: 'samuel_kim', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user19.jpg"), filename:"sample-user19.jpg")},
    {email:'julia_choi@example.com', name: 'julia_choi', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user20.jpg"), filename:"sample-user20.jpg")}
  ]
)

recipes = Recipe.create!(
  [
    {email: 'john_doe@example.com', name: 'john_doe', password: 'testpassword', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {production_area_id: 1, user_id: 1, name: 'エチオピアモカ', coffee_beans_name: 'タリーズエチオピアモカ', roast: 1, amount: 20, grind: 2, temperature: 90, total_pouring_amount: 300, extraction_amount: 270, total_extraction_time: 180, dripper: 'V60', paper: '純正', point: 'test data', status: 'true', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-recipe1.jpg"), filename:"sample-recipe1.jpg")},
  ]
)

