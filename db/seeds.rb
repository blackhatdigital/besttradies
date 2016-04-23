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
Category.where(name: "Plumber").first_or_create(name: "Plumber")
Category.where(name: "Bricky").first_or_create(name: "Bricky")

location = [
	"Gold Coast",
	"Brisbane",
	"Sydney",
	"Melbourne",
	"Perth",
	"Darwin"
]

User.where(email: "bob@example.com").first_or_create(firstname: "Bob", lastname: "Jane", email: "bob@test.com.au", password: "pw")
User.where(email: "bob@example.com").first_or_create(firstname: "Mike", lastname: "Bell", email: "mike@test.com.au", password: "pw")
User.where(email: "bob@example.com").first_or_create(firstname: "Jess", lastname: "Grove", email: "jess@test.com.au", password: "pw")
User.where(email: "bob@example.com").first_or_create(firstname: "Lis", lastname: "Edgar", email: "lis@test.com.au", password: "pw")

4.times do
	User.create(email: Faker::Internet.email, password: "pw")
end	

100.times do
	sleep 0.25
	Job.create(name: Faker::Name.title,
		description: Faker::Lorem.paragraph(2),
		budget: rand(200..10000),
		location: location.sample,
		user_id: rand(1..4),
		category_id: rand(1..3))
end