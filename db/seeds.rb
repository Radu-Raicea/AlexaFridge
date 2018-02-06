# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingr = Ingredient.create([
    { name: 'Butter', in_stock: false },
    { name: 'Bagel', in_stock: false },
    { name: 'Sliced Bread', in_stock: false },
    { name: 'English Muffin', in_stock: false },
    { name: 'Banana', in_stock: false },
    { name: 'Avocado', in_stock: false },
    { name: 'Orange', in_stock: false },
    { name: 'Mango', in_stock: false },
    { name: 'Raspberries', in_stock: false },
    { name: 'Strawberries', in_stock: false },
    { name: 'Blueberries', in_stock: false },
    { name: 'Mayo', in_stock: false },
    { name: 'Peanuts', in_stock: false },
    { name: 'Almonds', in_stock: false },
    { name: 'Walnuts', in_stock: false },
    { name: 'Spinach', in_stock: false },
    { name: 'Chia Seeds', in_stock: false },
    { name: 'Hemp Seeds', in_stock: false },
    { name: 'Pumpkin Seeds', in_stock: false },
    { name: 'Turkey', in_stock: false },
    { name: 'Feta Cheese', in_stock: false },
    { name: 'Tomatoes', in_stock: false },
    { name: 'Peppers', in_stock: false },
    { name: 'Pickles', in_stock: false },
    { name: 'Sliced Cheese', in_stock: false },
    { name: 'Milk', in_stock: false }
  ])

recipes = Recipe.create([
    { name: 'Turkey Sandwich', ingredients: [ingr[2], ingr[11], ingr[19], ingr[24]] }
  ])
