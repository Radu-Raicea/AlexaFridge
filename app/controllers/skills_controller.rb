class SkillsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def root
    input = AlexaRubykit.build_request(params)
    output = AlexaRubykit::Response.new
    session_end = false
    message = 'There was an error.'

    case input.type
    when 'LAUNCH_REQUEST'
      message = 'Fridge is open!'
    when 'INTENT_REQUEST'
      case input.name
      when 'MenuIntent'
        message, session_end = self.menu_message
      when 'BoughtIngredientIntent'
        message, session_end = self.bought_ingredient_message(input)
      when 'RanOutIngredientIntent'
        message, session_end = self.ran_out_ingredient_message(input)
      when 'CloseFridgeIntent', 'AMAZON.NoIntent'
        message, session_end = 'Closing fridge', true
      end
    when 'SESSION_ENDED_REQUEST'
      message = nil
    end

    output.add_speech(message) unless message.blank?
    render json: output.build_response(session_end)
  end

  def menu_message
    recipes = RecipesController.menu
    if recipes.empty?
      return 'You don\'t have enough ingredients to make anything!', false
    elsif !recipes.empty?
      return "You could make #{recipes[0]}", false
    else
      return 'Something went wrong.', true
    end
  end

  def bought_ingredient_message(input)
    name = input.slots['Ingredient']['value']
    ingredient = Ingredient.find_by(name: name)

    if ingredient.nil?
      return "There is no ingredient named #{name}.", false
    elsif ingredient.in_stock
      return "You already have #{name}!", false
    elsif !ingredient.in_stock
      ingredient.update(in_stock: true)
      return "You now have #{name}!", false
    else
      return 'Something went wrong.', true
    end
  end

  def ran_out_ingredient_message(input)
    name = input.slots['Ingredient']['value']
    ingredient = Ingredient.find_by(name: name)

    if ingredient.nil?
      return "There is no ingredient named #{name}.", false
    elsif ingredient.in_stock
      ingredient.update(in_stock: false)
      return "You have no more #{name}!", false
    elsif !ingredient.in_stock
      return "You already have no more #{name}!", false
    else
      return 'Something went wrong.', true
    end
  end
end
