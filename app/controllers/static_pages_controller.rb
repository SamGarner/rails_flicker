require 'flickr'

class StaticPagesController < ApplicationController
  def index
    if params[:user_id].blank?
      flash.now[:error] = "Please enter a user id."
      render 'index'
    else
      # API
    end
  end
end
