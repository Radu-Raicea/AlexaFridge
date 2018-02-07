# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingr = Ingredient.create([
    { name: 'butter', in_stock: false },
    { name: 'bagels', in_stock: false },
    { name: 'sliced bread', in_stock: false },
    { name: 'english muffins', in_stock: false },
    { name: 'bananas', in_stock: false },
    { name: 'avocados', in_stock: false },
    { name: 'oranges', in_stock: false },
    { name: 'mangos', in_stock: false },
    { name: 'raspberries', in_stock: false },
    { name: 'strawberries', in_stock: false },
    { name: 'blueberries', in_stock: false },
    { name: 'mayo', in_stock: false },
    { name: 'peanuts', in_stock: false },
    { name: 'almonds', in_stock: false },
    { name: 'walnuts', in_stock: false },
    { name: 'spinach', in_stock: false },
    { name: 'chia seeds', in_stock: false },
    { name: 'hemp seeds', in_stock: false },
    { name: 'pumpkin seeds', in_stock: false },
    { name: 'turkey', in_stock: false },
    { name: 'feta cheese', in_stock: false },
    { name: 'tomatoes', in_stock: false },
    { name: 'peppers', in_stock: false },
    { name: 'pickles', in_stock: false },
    { name: 'sliced cheese', in_stock: false },
    { name: 'milk', in_stock: false }
  ])

recipes = Recipe.create([
    { name: 'turkey sandwich', ingredients: [ingr[2], ingr[11], ingr[19], ingr[24]] }
  ])
