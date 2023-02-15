class UserSessionsController < ApplicationController
  def index
    redirect_to sign_in_path
  end

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)

    if @user_session.save
      flash[:success] = 'Bienvenue'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = 'À bientôt'
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
