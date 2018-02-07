require 'alexa_generator'
require 'json'

ingredients = [
  'butter',
  'bagel',
  'sliced bread',
  'english muffin',
  'banana',
  'avocado',
  'orange',
  'mango',
  'raspberries',
  'strawberries',
  'blueberries',
  'mayo',
  'peanuts',
  'almonds',
  'walnuts',
  'spinach',
  'chia seeds',
  'hemp seeds',
  'pumpkin seeds',
  'turkey',
  'feta cheese',
  'tomatoes',
  'peppers',
  'pickles',
  'sliced cheese',
  'milk'
]

model = AlexaGenerator::InteractionModel.build do |model|
  model.add_intent('AMAZON.NoIntent')

  model.add_intent(:MenuIntent) do |intent|
    intent.add_utterance_template('What can I eat')
    intent.add_utterance_template('What can I cook')
    intent.add_utterance_template('What\'s on the menu')
    intent.add_utterance_template('What can I make')
  end

  model.add_intent(:BoughtIngredientIntent) do |intent|
    intent.add_slot(:Ingredient, 'AMAZON.LITERAL') do |slot|
      slot.add_bindings(*ingredients)
    end
    intent.add_utterance_template('I bought {Ingredient}')
    intent.add_utterance_template('Add {Ingredient}')
  end

  model.add_intent(:RanOutIngredientIntent) do |intent|
    intent.add_slot(:Ingredient, 'AMAZON.LITERAL') do |slot|
      slot.add_bindings(*ingredients)
    end
    intent.add_utterance_template('I ran out of {Ingredient}')
    intent.add_utterance_template('There\'s no more {Ingredient}')
    intent.add_utterance_template('Remove {Ingredient}')
  end

  model.add_intent(:CloseFridgeIntent) do |intent|
    intent.add_utterance_template('Close the fridge')
    intent.add_utterance_template('I\'m done')
    intent.add_utterance_template('That\'s it')
    intent.add_utterance_template('Nothing else')
  end
end

puts JSON.pretty_generate(model.intent_schema)
puts model.sample_utterances(:MenuIntent)
puts model.sample_utterances(:BoughtIngredientIntent)
puts model.sample_utterances(:RanOutIngredientIntent)
puts model.sample_utterances(:CloseFridgeIntent)