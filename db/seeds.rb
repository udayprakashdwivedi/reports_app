# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Report.destroy_all

admin = User.create!(email: 'admin@example.com', password: 'password', admin: true)
user = User.create!(email: 'user@example.com', password: 'password', admin: false)

5.times do |i|
  Report.create!(
    title: "AI Market Report #{i + 1}",
    description: "<p>This is the <strong>description</strong> of report #{i + 1}.</p>",
    category: %w[AI Healthcare Fintech].sample,
    status: %w[draft published archived].sample,
    published_on: Date.today - rand(30),
    user: [admin, user].sample
  )
end
