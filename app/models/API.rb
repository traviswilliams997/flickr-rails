class API
    require 'rest-client'
    require 'json'
    @@url_base = 'https://www.flickr.com/services/rest/?'

    def self.get_data(id_parameter)
      @response = RestClient.get( "#{@@url_base}method=flickr.people.getPublicPhotos&api_key=#{ENV['FLICKR_KEY']}&user_id=#{id_parameter}&format=json&nojsoncallback=1")
      @user_photos = JSON.parse(@response)   
      self.initialize_url
    end

    def self.initialize_url
      @user_photos["photos"]["photo"].each do |photo| 
        Url.new(photo["server"],photo["id"], photo["secret"])
      end 
    end
end