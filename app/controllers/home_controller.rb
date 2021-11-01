require 'httparty'
class HomeController < ApplicationController

  def index
      @url = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=london&appid=1aafa1f2db60933c90470d715afc482d")

      @lon = @url['coord']['lon']
      @lat = @url['coord']['lat']

      
  end

end
