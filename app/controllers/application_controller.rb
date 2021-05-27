# frozen_string_literal: true

# Here goes shared controllers logic
class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
