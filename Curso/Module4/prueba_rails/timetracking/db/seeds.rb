# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.destroy_all
Person.destroy_all
Participation.destroy_all

Project.create!(name: "Shopping", description: "Make the horrible Shopping")
Project.create!(name: "Reading", description: "Take the e-reader and enjoy")
Project.create!(name: "Siesta", description: "Take a rest")
Project.create!(name: "Go with friends", description: "drink&eat&speak")
Project.create!(name: "Cooking", description: "Learning, basics")
Project.create!(name: "Mother visit", description: "She likes very much")
Project.create!(name: "Running", description: "Are you mad?")
Project.create!(name: "Home", description: "wife&sons")
Project.create!(name: "BBVA", description: "job principal")
Project.create!(name: "Ironhack", description: "Description")

project2 = Project.where("name='Reading'")[0]
project2.time_entries.create(hours: 23, minutes: 23)
project2.time_entries.create(hours: 13, minutes: 13)

project3 = Project.where("name='Home'")[0]
5.times do |index|
	project3.time_entries.create(hours: (2+index), minutes: (2+index))
	project3.time_entries.create(hours: (10+index), minutes: (10+index))
end

project = Project.first
project.time_entries.create!(hours: 24, minutes: 24, comments: 'nada', date: Date.today )
project.time_entries.create!(hours: 12, minutes: 12, comments: 'nada', date: Date.today )


Person.create!(name: "Pedro", edad: 26)
Person.create!(name: "Juan", edad: 26)
Person.create!(name: "Maria", edad: 24)
Person.create!(name: "Juan", edad: 25)
Person.create!(name: "Carlos", edad: 30)
Person.create!(name: "Ana", edad: 28)