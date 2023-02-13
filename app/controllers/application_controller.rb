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

  def require_user
    return if current_user

    store_location
    flash[:notice] = 'You must be logged in to access this page'
    redirect_to new_user_url
  end

  def store_location
    session[:return_to] = request.original_url
  end

  helper_method :current_user_session, :current_user
end
