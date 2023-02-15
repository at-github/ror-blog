class UsersController < ApplicationController
  before_action :require_admin, only: %I[index]

  def index
    @users = User.all
  end

  def show
    redirect_to :users
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      flash[:success] = 'Compte crée, bienvenue'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_column(:role, params[:user][:role])
    flash[:success] = 'Utilisateur modifié'
    redirect_to :users
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to :users, status: :see_other
  end

  private

  def users_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
