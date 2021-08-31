class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: -> { static_page? }

  private

  def static_page?
    controller_name == 'homes'
  end
end
