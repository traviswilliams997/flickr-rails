class StaticPagesController < ApplicationController

  def index 
    if params[:flickr_id].present?
      @user_photos_info =  API.get_data(params[:flickr_id])
      initialize_url(@user_photos_info) 
      retrieve_urls 
    end
  end

  private

  def flickr_params
    params.permit(:flickr_id)

  end 

  def  initialize_url(info)
    info["photos"]["photo"].each do |photo| 
      Url.new(photo["server"],photo["id"], photo["secret"])
    end 
  end

  def retrieve_urls 
    @urls = Url.get_urls 
  end
end
