class HomeController < ApplicationController
  def index
    @images = Image.all
    @user = current_user.id
  end
end
