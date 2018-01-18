require 'twitter'
require 'pry'
require 'inifile'

config = IniFile.load('app.ini')["config"]

client = Twitter::Streaming::Client.new(config)
# binding.pry
p client

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts object.text if object.is_a?(Twitter::Tweet)
end
