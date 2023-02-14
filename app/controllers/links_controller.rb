class LinksController < ApplicationController
  before_action :require_user, except: %I[index show]

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:text, :link)
  end
end
