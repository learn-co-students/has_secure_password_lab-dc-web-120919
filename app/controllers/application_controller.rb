class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  def current_user 
    #sets id or makes a new user object for use in login
    # if User.find_by(id: session[:user_id])
    #   @user = User.find_by(id: session[:id])
    # else 
    #   @user = User.new 
    # end 

    @user = (User.find_by(id: session[:user_id]) || User.new )
  end 

  def logged_in?
    current_user.id != nil 
  end 

  def user_login_check
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in? 
  end 

end
