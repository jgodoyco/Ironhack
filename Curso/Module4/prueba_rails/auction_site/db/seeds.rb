# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create!(name: "Pepe", email: "pjoseepevil@gmail.com" )
User.create!(name: "Juan",  email: "adver@hotmail.com" )
User.create!(name: "Maria",  email: "runca@gmail.com" )
User.create!(name: "Fran", email: "loster@gmail.com" )
User.create!(name: "Sara",  email: "sperez@hotmail.com" )
User.create!(name: "Ana", email: "cfgyer@hotmail.com" )
User.create!(name: "Carlos",  email: "vigohh@gmail.com" )
User.create!(name: "Bea", email: "godote@gmail.com" )
User.create!(name: "Rodrigo", email: "jiste@hotmail.com" )
User.create!(name: "Daniela",  email: "marg@gmail.com" )
User.create!(name: "Jose", email: "sdac@hotmail.com" )
User.create!(name: "Javier", email: "ppter@gmail.com" )
User.create!(name: "Pedro",  email: "jghfer@hotmail.com" )
User.create!(name: "Maria Dolores",  email: "maryplus@hotmail.com" )
User.create!(name: "Sergio", email: "sdelh@gmail.com" )
User.create!(name: "Miguel",  email: "miguelitoruiz@gmail.com" )
User.create!(name: "Raul",  email: "rauuuu@gmail.com" )

userWP1 = User.create!(name: "Margarita",  email: "marga@gmail.com" )
userWP1.products.create(title: "pen", description: "pen-apple-pen", deadline: Date.today+7)
userWP1.products.create(title: "house", description: "House of cards", deadline: Date.today+7)
userWP1.products.create(title: "car", description: "Mercedes berlina", deadline: Date.today+7)

userWP2 = User.create!(name: "Marcos",  email: "marcotegui@gmail.com" )
userWP2.products.create(title: "ship", description: "long longyate ", deadline: Date.today+14)
userWP2.products.create(title: "motorbike", description: "Gilera 250cc", deadline: Date.today+14)
userWP2.products.create(title: "tree", description: "Lemon Tree", deadline: Date.today+14)