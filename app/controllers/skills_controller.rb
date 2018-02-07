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
      when 'MenuIntent', 'AMAZON.YesIntent'
        if params['session']['attributes'].nil? || params['session']['attributes']['recipes'].blank?
          recipes = RecipesController.menu
        else
          recipes = params['session']['attributes']['recipes']
        end
        output.add_session_attribute('recipes', recipes[3..-1]) unless recipes.nil?
        message, session_end = MessageCreator.menu_message(recipes)
      when 'IngredientsForIntent'
        message, session_end = MessageCreator.ingredients_for_message(input)
      when 'BoughtIngredientIntent'
        message, session_end = MessageCreator.bought_ingredient_message(input)
      when 'RanOutIngredientIntent'
        message, session_end = MessageCreator.ran_out_ingredient_message(input)
      when 'HaveIngredientIntent'
        message, session_end = MessageCreator.have_ingredient_message(input)
      when 'CloseFridgeIntent', 'AMAZON.NoIntent'
        if params['session']['attributes'].nil? || params['session']['attributes']['recipes'].blank?
          message, session_end = 'Closing fridge', true
        else
          message, session_end = 'Ok.', false
        end
      end
    when 'SESSION_ENDED_REQUEST'
      message = nil
    end

    output.add_speech(message) unless message.blank?
    render json: output.build_response(session_end)
  end
end

class MessageCreator
  def self.menu_message(recipes)
    if recipes.empty?
      return 'You don\'t have enough ingredients to make anything!', false
    elsif recipes.length == 1
      return "You could make #{recipes.first}", false
    elsif recipes.length > 1
      message = "You could make"
      recipes[0,3].each do |recipe|
        if recipe != recipes[0,3].last
          message << " #{recipe},"
        else
          message << " or #{recipe}."
        end
      end
      message << ' Do you want other options?' if recipes.length > 3
      return message, false
    else
      return 'Something went wrong.', true
    end
  end

  def self.ingredients_for_message(input)
    name = input.slots['Recipe']['value']
    recipe = Recipe.find_by(name: name)

    if recipe.nil?
      return "There is no recipe named #{name}.", false
    elsif recipe.ingredients.empty?
      return "There are no ingredients set for #{name}."
    elsif recipe.ingredients.length == 1
      return "The recipe for #{name} requires #{recipe.ingredients.first.name}."
    elsif recipe.ingredients.length > 1
      message = "The recipe for #{name} requires"
      recipe.ingredients.each do |ingredient|
        if ingredient != recipe.ingredients.last
          message << " #{ingredient.name},"
        else
          message << " and #{ingredient.name}."
        end
      end
      return message, false
    else
      return 'Something went wrong.', true
    end
  end

  def self.bought_ingredient_message(input)
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

  def self.ran_out_ingredient_message(input)
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

  def self.have_ingredient_message(input)
    name = input.slots['Ingredient']['value']
    ingredient = Ingredient.find_by(name: name)

    if ingredient.nil?
      return "There is no ingredient named #{name}.", false
    elsif ingredient.in_stock
      return "You have #{name}!", false
    elsif !ingredient.in_stock
      return "You don't have #{name}!", false
    else
      return 'Something went wrong.', true
    end
  end
end
