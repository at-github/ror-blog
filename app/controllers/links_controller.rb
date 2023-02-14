class LinksController < ApplicationController
  before_action :require_user, except: %I[index show]

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      flash[:success] = 'Lien crée'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      flash[:success] = 'Lien mis à jour'
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def link_params
    params.require(:link).permit(:text, :link)
  end
end
