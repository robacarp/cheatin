class SessionsController < ApplicationController
  def login
    if params[:user].nil?
      redirect_to 'index'
    end

    user = User.where(:email=>params[:user][:email]).first

    if !user.nil? && user.valid_password?(params[:user][:password])
      #set up session
      session[:user_id] = user.id.to_s
      flash[:notice] = "YOU ARE SUCCESS."
      redirect root
    else
      flash[:notice] = "Incorrect email or password. Try agains."
      render 'index'
    end

  end

  def logout
    reset_session
  end
end
