class HomeController < ApplicationController
  def index
    @images = Image.all
    if current_user
      @user = current_user.id
    end
  end
end
