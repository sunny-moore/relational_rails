# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author1 = Author.create!(name: 'Brandon Sanderson', awards: 6, deceased: false)
author2 = Author.create!(name: 'Kathleen Woodiwiss', awards: 0, deceased: true)
author3 = Author.create!(name: 'Veronica Roth', awards: 1, deceased: false)

author1.books.create!(name: 'The Way of Kings', length: 575, in_print: true)
author1.books.create!(name: 'Oathbringer', length: 545, in_print: true)
author1.books.create!(name: 'Mistborn', length: 345, in_print: true)

author2.books.create!(name: 'Shanna', length: 500, in_print: false)
author1.books.create!(name: 'The Wolf and the Dove', length: 445, in_print: false)

author3.books.create!(name: 'Divergent', length: 345, in_print: true)
author3.books.create!(name: 'Insurgent', length: 345, in_print: true)
author3.books.create!(name: 'Four', length: 345, in_print: true)
