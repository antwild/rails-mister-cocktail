require 'json'
require 'open-uri'

puts "Deleting old seed"
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

response = JSON.parse(open(url).read)

puts "Seeding ingredients"
response["drinks"].each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end

puts "Done"
