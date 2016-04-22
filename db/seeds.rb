# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.where(name: "Electrician").first_or_create(name: "Electrician")
Category.where(name: "Construction").first_or_create(name: "Construction")
Category.where(name: "Chippy").first_or_create(name: "Chippy")

location = [
	"Gold Coast","Gold Coast",
	"Brisbane","Brisbane",
	"Sydney","Sydney",
	"Melbourne","Melbourne"
]

User.where(email: "bob@example.com").first_or_create(firstname: "Bob", password: "pw")

10.times do
	User.create(email: Faker::Internet.email, password: "pw")
end	

100.times do
	Job.create(name: Faker::Name.title,
		description: Faker::Lorem.paragraph(2),
		budget: rand(200..10000),
		location: location.sample,
		user_id: 1,
		category_id: rand(1..3))
end