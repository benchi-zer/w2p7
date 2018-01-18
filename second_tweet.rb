require 'twitter'
require 'pry'
require 'inifile'

config = IniFile.load('app.ini')["config"]

client = Twitter::REST::Client.new(config)
# binding.pry
p client

client.update('Mon second tweet en ruby !!!!')
