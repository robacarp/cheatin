class ApplicationController < ActionController::Base
  before_filter :sessionify

  helper_method :authorize!, :current_user, :user_signed_in?

#protect_from_forgery

  def authorize! resource = nil
    case
    when resource.nil?
      true
    when resource.class == 'Symbol'
      authorize_by_symbol resource
    else
      authorize_by_class resource
    end
  end

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

private
  def authorize_by_symbol sym
    case
    when sym == :create_sheet && current_user.admin?
      true
    else
      false
    end
  end

  def authorize_by_class cls
    case
    when current_user.admin?
      true
    else
      false
    end
  end

end
