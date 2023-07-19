class StaticPagesController < ApplicationController

  before_action :set_user_photos, only: [:index]
  def index

    require 'rest-client'
    require 'json'


    url = 'https://www.flickr.com/services/rest/?'

   

    @response = RestClient.get( "#{url}method=flickr.people.getPublicPhotos&api_key=#{ENV['FLICKR_KEY']}&user_id=#{params[:flickr_id]}&format=json&nojsoncallback=1")
    @user_photos = JSON.parse(@response)

    count = 0 
    @url_array = []
    @user_photos["photos"]["photo"].each do |photo| 
      @url_array[count] = "https://live.staticflickr.com/#{photo["server"]}/#{photo["id"]}_#{photo["secret"]}.jpg"
      count = count + 1
      
      end 
  
  

  end

  private
  
  def flickr_params
    params.permit(:flickr_id)

  end 

  def set_user_photos
    @user_photos = {"photos"=> { "photo"=> [ {"id"=> "1", "owner"=>"me", "secret"=>"none", "server"=> "local"}]}}
  end

end
