class SkillsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def root
    input = AlexaRubykit.build_request(params)
    output = AlexaRubykit::Response.new
    session_end = true
    message = 'There was an error.'

    case input.type
    when 'LAUNCH_REQUEST'
      session_end = false
      message = 'Welcome to your fridge, what do you want to do?'
    when 'INTENT_REQUEST'
      case input.name
      when 'MenuIntent'
        recipes = RecipesController.menu
        if recipes.empty?
          message = 'You don\'t have enough ingredients to make anything!'
        else
          message = "You could make #{recipes[0]}"
        end
      end
    when 'SESSION_ENDED_REQUEST'
      message = nil
    end

    output.add_speech(message) unless message.blank?
    render json: output.build_response(session_end)
  end
end
