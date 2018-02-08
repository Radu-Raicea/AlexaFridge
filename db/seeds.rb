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
    { name: 'mango', in_stock: false },
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
    { name: 'milk', in_stock: false },
    { name: 'eggs', in_stock: false },
    { name: 'cream cheese', in_stock: false },
    { name: 'goat cheese', in_stock: false },
    { name: 'tomato sauce', in_stock: false },
    { name: 'frozen pizza', in_stock: false },
    { name: 'olive oil', in_stock: false },
    { name: 'vinegar', in_stock: false },
    { name: 'jam', in_stock: false },
    { name: 'frozen croissant', in_stock: false },
    { name: 'spaghetti', in_stock: false },
    { name: 'farfalle', in_stock: false },
    { name: 'peanut butter', in_stock: false }
  ])

recipes = Recipe.create([
    { name: 'turkey sandwich', ingredients: [ingr[2], ingr[11], ingr[19], ingr[24]] },
    { name: 'avocado salad', ingredients: [ingr[5], ingr[15], ingr[21], ingr[22], ingr[31], ingr[32]] },
    { name: 'feta salad', ingredients: [ingr[15], ingr[20], ingr[21], ingr[22], ingr[31], ingr[32]] },
    { name: 'grilled cheese', ingredients: [ingr[2], ingr[24]] },
    { name: 'spaghetti', ingredients: [ingr[0], ingr[29], ingr[35]] },
    { name: 'farfalle pasta', ingredients: [ingr[0], ingr[29], ingr[36]] },
    { name: 'pizza', ingredients: [ingr[30]] },
    { name: 'avocado sandwich', ingredients: [ingr[2], ingr[5], ingr[11], ingr[22]] },
    { name: 'egg mcmuffin', ingredients: [ingr[0], ingr[3], ingr[19], ingr[24], ingr[26]] },
    { name: 'peanut butter jelly', ingredients: [ingr[2], ingr[33], ingr[37]] },
    { name: 'cream cheese toast', ingredients: [ingr[2], ingr[27]] },
    { name: 'egg croissant', ingredients: [ingr[0], ingr[26], ingr[34]] },
  ])
