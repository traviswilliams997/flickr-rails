class StaticPagesController < ApplicationController

  def index

    require 'rest-client'
    require 'json'

    url_base = 'https://www.flickr.com/services/rest/?'

   
  
    
    if params[:flickr_id].present?
      @response = RestClient.get( "#{url_base}method=flickr.people.getPublicPhotos&api_key=#{ENV['FLICKR_KEY']}&user_id=#{params[:flickr_id]}&format=json&nojsoncallback=1")
      @user_photos = JSON.parse(@response)
     
      @user_photos["photos"]["photo"].each do |photo| 
  
          Url.new(photo["server"],photo["id"], photo["secret"])
          
          end 
    end
  

  end

  private
  
  def flickr_params
    params.permit(:flickr_id)

  end 



end
