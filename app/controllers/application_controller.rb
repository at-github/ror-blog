class ApplicationController < ActionController::Base
  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)

    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)

    @current_user = current_user_session&.user
  end

  def current_admin
    current_user&.role == 'ADMIN'
  end

  def require_user
    return if current_user

    store_location
    flash[:notice] = 'You must be logged in to access this page'
    redirect_to new_user_url
  end

  def require_admin
    return if current_admin

    store_location
    flash[:danger] = 'You are not authorize'
    redirect_to root_url
  end

  def store_location
    session[:return_to] = request.original_url
  end

  helper_method :current_user_session, :current_user, :current_admin
end
