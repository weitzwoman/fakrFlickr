class ImagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @image = Image.new
    @images = Image.where(owner_id: current_user.id)
    @user = current_user.id
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(paperclip: image_params[:paperclip], owner_id: current_user.id)
    if @image.save
      redirect_to images_path
    else
      render :back
    end
  end

  def show
    @user = current_user.id
    @image = Image.find(params[:id])
  end

  def edit
    @user = current_user.id
    @image = Image.find(params[:id])
  end

  def update
    @user = current_user.id
    @image = Image.find(params[:id])
    if @image.update(user_ids: tag_params[:user_ids])
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    @user = current_user.id
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to user_images_path
  end

  def upvote
    @image = Image.find(params[:id])
    @image.upvote_by current_user
    redirect_to :back
  end

private
  def image_params
    params.require(:image).permit(:paperclip)
  end

  def tag_params
    params.require(:image).permit({user_ids: []})
  end
end
