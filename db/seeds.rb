# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ingr = Ingredient.create([
    { name: 'Butter' },
    { name: 'Bagel' },
    { name: 'Sliced Bread' },
    { name: 'English Muffin' },
    { name: 'Banana' },
    { name: 'Avocado' },
    { name: 'Orange' },
    { name: 'Mango' },
    { name: 'Raspberries' },
    { name: 'Strawberries' },
    { name: 'Blueberries' },
    { name: 'Mayo' },
    { name: 'Peanuts' },
    { name: 'Almonds' },
    { name: 'Walnuts' },
    { name: 'Spinach' },
    { name: 'Chia Seeds' },
    { name: 'Hemp Seeds' },
    { name: 'Pumpkin Seeds' },
    { name: 'Turkey' },
    { name: 'Feta Cheese' },
    { name: 'Tomatoes' },
    { name: 'Peppers' },
    { name: 'Pickles' },
    { name: 'Sliced Cheese' },
    { name: 'Milk' }
  ])

recipes = Recipe.create([
    { name: 'Turkey Sandwich', ingredients: [ingr[2], ingr[11], ingr[19], ingr[24]] }
  ])
