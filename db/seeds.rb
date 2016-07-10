# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.where(name: "Air Conditioning").first_or_create(name: "Air Conditioning")
Category.where(name: "Bathrooms").first_or_create(name: "Bathrooms")
Category.where(name: "Building").first_or_create(name: "Building")
Category.where(name: "Carpenting").first_or_create(name: "Carpenting")
Category.where(name: "Cleaning").first_or_create(name: "Cleaning")
Category.where(name: "Concreting").first_or_create(name: "Concreting")
Category.where(name: "Electrical").first_or_create(name: "Electrical")
Category.where(name: "Engineering").first_or_create(name: "Engineering")
Category.where(name: "Fencing").first_or_create(name: "Fencing")
Category.where(name: "Removalists").first_or_create(name: "Removalists")
Category.where(name: "Glazier").first_or_create(name: "Glazier")
Category.where(name: "Guttering").first_or_create(name: "Guttering")
Category.where(name: "Handyman").first_or_create(name: "Handyman")
Category.where(name: "Kitchens").first_or_create(name: "Kitchens")
Category.where(name: "Landscapers").first_or_create(name: "Landscapers")
Category.where(name: "Painters").first_or_create(name: "Painters")
Category.where(name: "Pest Control").first_or_create(name: "Pest Control")
Category.where(name: "Plastering").first_or_create(name: "Plastering")
Category.where(name: "Plumbers").first_or_create(name: "Plumbers")
Category.where(name: "Pool Building").first_or_create(name: "Pool Building")
Category.where(name: "Rendering").first_or_create(name: "Rendering")
Category.where(name: "Roofing").first_or_create(name: "Roofing")
Category.where(name: "Steel Fixing").first_or_create(name: "Steel Fixing")
Category.where(name: "Tilers").first_or_create(name: "Tilers")
Category.where(name: "Other Bits and Bobs").first_or_create(name: "Other Bits and Bobs")

