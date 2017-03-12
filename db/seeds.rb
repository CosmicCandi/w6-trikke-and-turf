# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  @username = Faker::Internet.user_name(nil, %w(_ -))
  @user = User.create!(
    username: @username,
    image: Faker::Avatar.image,
    bio: Faker::Hipster.paragraph(2),
    email: Faker::Internet.safe_email(@username)
  )

  3.times do
    @post = Post.create!(
      title: Faker::TwinPeaks.quote,
      body: Faker::Hipster.paragraph(rand(1..6)),
      user: @user,
      created_at: rand(1..700).days.ago
    )
  end
end
