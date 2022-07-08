# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Beer.destroy_all
Brewery.destroy_all

new_belgium = Brewery.create!(name: 'New Beligum Brewing', age: 31, pet_friendly: true)
odell = Brewery.create!(name: 'Odell Brewing', age: 33, pet_friendly: true)
funkwerks = Brewery.create!(name: 'Funkwerks', age: 12, pet_friendly: true)
aleworks = Brewery.create!(name: 'Loveland Aleworks', age: 10, pet_friendly: false)

new_belgium.beers.create!(name: 'La Folie', style: 'Oud Bruin', review_rating: 10, in_stock: false)
new_belgium.beers.create!(name: 'Fat Tire', style: 'Amber', review_rating: 4, in_stock: true)

odell.beers.create!(name: 'Odell IPA', style: 'IPA', review_rating: 8, in_stock: true)
odell.beers.create!(name: '90 Schilling', style: 'Amber', review_rating: 7, in_stock: true)

funkwerks.beers.create!(name: 'Funkwerks Saison', style: 'Saison', review_rating: 10, in_stock: true)
funkwerks.beers.create!(name: 'Funkwerks Helles', style: 'Helles', review_rating: 8, in_stock: true)

aleworks.beers.create!(name: 'Darkest Day', style: 'Coconut Porter', review_rating: 7, in_stock: true)
aleworks.beers.create!(name: 'Work Ethic', style: 'Pale Ale', review_rating: 6, in_stock: false)
