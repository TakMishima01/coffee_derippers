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
    {email:'john_doe@example.com', name: 'john_doe', password: 'testpassword'},
    {email:'janesmith@example.com', name: 'janesmith', password: 'testpassword'},
    {email:'mike_jones@example.com', name: 'mike_jones', password: 'testpassword'},
    {email:'sara_kim@example.com', name: 'sara_kim', password: 'testpassword'},
    {email:'david_lee@example.com', name: 'david_lee', password: 'testpassword'},
    {email:'mary_smith@example.com', name: 'mary_smith', password: 'testpassword'},
    {email:'jason_kim@example.com', name: 'jason_kim', password: 'testpassword'},
    {email:'emily_wang@example.com', name: 'emily_wang', password: 'testpassword'},
    {email:'peter_nguyen@example.com', name: 'peter_nguyen', password: 'testpassword'},
    {email:'stephanie_choi@example.com', name: 'stephanie_choi', password: 'testpassword'},
    {email:'kevin_kang@example.com', name: 'kevin_kang', password: 'testpassword'},
    {email:'jennifer_park@example.com', name: 'jennifer_park', password: 'testpassword'},
    {email:'joshua_lee@example.com', name: 'joshua_lee', password: 'testpassword'},
    {email:'kristen_kim@example.com', name: 'kristen_kim', password: 'testpassword'},
    {email:'benjamin_wong@example.com', name: 'benjamin_wong', password: 'testpassword'},
    {email:'rachel_kim@example.com', name: 'rachel_kim', password: 'testpassword'},
    {email:'andrew_lee@example.com', name: 'andrew_lee', password: 'testpassword'},
    {email:'lisa_wang@example.com', name: 'lisa_wang', password: 'testpassword'},
    {email:'samuel_kim@example.com', name: 'samuel_kim', password: 'testpassword'},
    {email:'julia_choi@example.com', name: 'julia_choi', password: 'testpassword'}
  ]
)