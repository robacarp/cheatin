class ApplicationController < ActionController::Base
#  protect_from_forgery
  before_filter :sessionify
  def sessionify
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
    #TODO add ActiveRecord NotFound catching
  end

  def current_user
    @current_user ||= sessionify || User.new
  end

  def user_signed_in?
    !current_user.nil? && !current_user.new_record?
  end
end
