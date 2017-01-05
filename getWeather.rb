#!/usr/bin/ruby
# coding: utf-8

require "./bot"
require "net/http"
require "json"

uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=tokyo,japan")

def getWeather(uri)
   json = Net::HTTP.get(uri)
   result = JSON.parse(json)
   weather = result['weather'][0]['main']
   max = result['main']['temp_max'] - 273.15
   min = result['main']['temp_min'] - 273.15
   return "*** 今日の天気 ***\n 天気：#{weather}\n 最高気温：#{max.round}\n 最低気温：#{min.round}\n"
end

weather = getWeather(uri)
client = TwiBot.new($CONSUMER_KEY,$CONSUMER_SECRET,$ACCESS_TOKEN,$ACCESS_TOKEN_SECRET)
client.tweet(weather)
