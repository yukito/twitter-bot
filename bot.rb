require "twitter"

$CONSUMER_KEY = "YOUR OWN KEY"
$CONSUMER_SECRET = "YOUR OWN SECRET"
$ACCESS_TOKEN = "YOUR OWN TOKEN"
$ACCESS_TOKEN_SECRET = "YOUR OWN SECRET"
$BOT_ACCOUNT = "YOUR OWN ACCOUNT"

class TwiBot
   def initialize(ck,cs,at,ats)
      @bot_handler = Twitter::REST::Client.new do |config|
         config.consumer_key = ck
         config.consumer_secret = cs
         config.access_token = at
         config.access_token_secret = ats
      end
   end

   def tweet(message)
      @bot_handler.update(message)
   end

   def get_home
      @bot_handler.home_timeline.each do |timeline|
         puts "--------------------"
         puts @bot_handler.status(timeline).text
      end
   end

   def get_timeline(user="")
      @bot_handler.user_timeline(user).each do |timeline|
         puts "--------------------"
         puts @bot_handler.status(timeline).text
      end
   end

   def get_followerlist(user="")
      @bot_handler.followers(user).each do |follower|
         puts "--------------------"
         puts follower.screen_name
         puts follower.name
         puts follower.description
      end
   end

   def get_friends(user="")
      @bot_handler.friends(user).each do |friend|
         puts "--------------------"
         puts friend.screen_name
         puts friend.name
         puts friend.description
      end
   end

	def get_world_timeline
      @bot_handler.public_timeline().each do |timeline|
         puts "--------------------"
         puts timeline
      end
	end
end

