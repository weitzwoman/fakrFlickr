class ImagesController < ApplicationController
  before_filter :authenticate_user!, except: [:index]


  def index
    @images = Image.all
    @image = Image.new
    @user = current_user.id
    # @images = Image.where(owner_id: @user.id)
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
    if @image.update(image_params)
      render :back
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

private
  def image_params
    params.require(:image).permit(:paperclip)
  end
end
