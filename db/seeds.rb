# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.destroy_all
Product.create([
  { name: "radio1", description: "black and very loud", shop:"HEMA" },
  { name: "radio2", description: "yellow and great sound", shop:"OhRadio"}
])

#Review.destroy_all
#Review.create([
#   { product: radio1.id, name: "Jan", rating: 3, reviewText:"Prima" },
#   { product: radio1.id, name: "Bert", rating: 4, reviewText:"Goed" },
#   { product: radio2.id, name: "Ali", rating: 2, reviewText:"tja" },
#   { product: radio2.id, name: "Miep", rating: 3, reviewText:"ok" },
# ])
