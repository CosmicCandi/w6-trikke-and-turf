# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  @username = Faker::Internet.user_name(nil, %w(-))
  @user = User.create!(
    username: @username,
    password: Faker::Internet.password
    image: Faker::Avatar.image,
    bio: Faker::Hipster.paragraph(3),
    email: Faker::Internet.safe_email(@username)
  )

  3.times do
    photo_array = ["redtrikke.jpg", "lifestyles_pro_01.gif", "T78csCUTout.png", "trikkeinaction.jpg"]

    @post = Post.create!(
      title: Faker::StarWars.quote,
      body: Faker::Hipster.paragraphs(rand(5..8)).join("\n\n"),
      user: @user,
      photo: photo_array.sample,
      created_at: rand(1..700).days.ago
    )
  end
end
