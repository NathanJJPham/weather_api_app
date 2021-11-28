require 'httparty'
require 'date'

class HomeController < ApplicationController

  API_KEY = ENV["API_KEY"]
  
  def index

    @search = params[:search]
    @search = 'tampa' if @search.nil?
    if @search.include?(" ")
      @search.gsub(" ", "%20")
    else
      @search
    end
    
    @current_weather = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{@search}&appid=#{API_KEY}&units=imperial")
    @lon = @current_weather['coord']['lon']
    @lat = @current_weather['coord']['lat']

    @forecast_weather = HTTParty.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{@lat}&lon=#{@lon}&exclude=&appid=#{API_KEY}&units=imperial")
      
  end

end
