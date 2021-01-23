require 'flickr'

class StaticPagesController < ApplicationController
  def index
    if params[:user_id].blank?
      flash.now[:error] = "Please enter a user id."
      render 'index'
    else
      # API
      flickr = Flickr.new(Figaro.env.flickr_api_key, Figaro.env.flickr_api_secret)
      @photos = flickr.photos.search(api_key: Figaro.env.flickr_api_key, user_id: params[:user_id])
      # flickr = Flickr.new(ENV['FLICKR_API_KEY'], ENV['FLICKR_API_SECRET'])
      # @photos = flickr.photos.search(api_key: ENV['FLICKR_API_KEY'], user_id: params[:user_id])

      render 'index'
    end
  end
end
