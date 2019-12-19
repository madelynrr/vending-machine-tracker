# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
owner = Owner.create(name: "Sam's Snacks")
dons  = owner.machines.create(location: "Don's Mixed Drinks")
mikes  = owner.machines.create(location: "Mike's Place")


snickers = Snack.create(name: "Snickers", price: 1)
bbq = Snack.create(name: "BBQ Potato Chips", price: 2)
mms = Snack.create(name: "M&Ms", price: 1)

dons.snacks << [snickers, bbq]
mikes.snacks << [snickers, bbq, mms]
