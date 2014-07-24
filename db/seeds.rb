# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
	Cat.create(
		name: Faker::Name.first_name,
		breed: Faker::Hacker.adjective, 
		bio: Faker::Lorem.paragraph,
		catchphrase: Faker::Company.catch_phrase )
end