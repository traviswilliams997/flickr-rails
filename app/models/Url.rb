class Url
    @@all = []
    @@url_array = []


    attr_accessor :server, :id, :secret

    def initialize(args_hash)
        args_hash.each do |key, value |
        self.send("#{key}=", value) if self.respond_to?("#{key}=") 
        end
        create_url
        save_url
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end 

    def create_url
      @url =  "https://live.staticflickr.com/#{@server}/#{@id}_#{@secret}.jpg"
    end

    def save_url
        @@url_array << @url
    end

    def self.get_urls
        @@url_array
    end

end