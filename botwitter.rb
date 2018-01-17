# Load the twitter gem
require 'twitter'
# Load the dotenv gem
require 'dotenv'
# require 'pry'

# This tells dotenv to read the .env file and set the appropriate variables
Dotenv.load
if !File.exist?(".env")
  # Exit the program entirely
  exit
end
ENV['TWITTER_API_KEY']
ENV['TWITTER_API_SECRET']
ENV['TWITTER_TOKEN']
ENV['TWITTER_TOKEN_SECRET']
ENV['GITHUB_ACCESS_TOKEN']

# This prints out the names and values of all the environment variables
ENV.each do |var, value|
  puts "#{var}=#{value}"
end

# i = 1
# for i in 1..1000
# binding.pry
# i+=1

client = Twitter::Streaming::Client.new do |config|
  ENV['TWITTER_API_KEY']
  ENV['TWITTER_API_SECRET']
  ENV['TWITTER_TOKEN']
  ENV['TWITTER_TOKEN_SECRET']
end
#analyse le stream de twitter dans son ensemble

i=0
#variable de stockage

topics = ["cours de Ruby"]
client.filter(track: topics.join(",")) do |object|
  i+=1 #Interromp le stream pour agir
  puts "#{object.user.screen_name}: #{object.text}" if object.is_a?(Twitter::Tweet)
  if i>0
    client = Twitter::REST::Client.new do |config|
      ENV['TWITTER_API_KEY']
      ENV['TWITTER_API_SECRET']
      ENV['TWITTER_TOKEN']
      ENV['TWITTER_TOKEN_SECRET']
    end
    #des qu'il trouve un tweet qui correspond aux criteres definis, le bot entame
    #une phase de like du tweet concerne + il commente "viens chercher bonheur"
    #Il continue cependant a streamer le flux Twitter

    client.favorite(object)
    client.update("@#{object.user.screen_name}"+" Viens chercher bonheur chez THP")
  end
end
