require 'alexa_generator'
require 'json'

model = AlexaGenerator::InteractionModel.build do |model|
  model.add_intent(:MenuIntent) do |intent|
    intent.add_utterance_template('What can I eat')
    intent.add_utterance_template('What can I cook')
    intent.add_utterance_template('What\'s on the menu')
    intent.add_utterance_template('What can I make')
  end
end

puts JSON.pretty_generate(model.intent_schema)
puts model.sample_utterances(:MenuIntent)
