# Stupidly simple bare bones add stuff to instapaper
# I was migrating from pocket to instapaper and needed bulk import ability
# Instructions
# - create a json file like links.json with all the aticles you want to add
# - drop in your username and password
# - in terminal run "ruby instapaper_importer.rb". if you have a lot of items - it may take a while

require "json"
require 'httparty'

url = "https://www.instapaper.com/api/add"
username = "emailadddress@gmail.com"
password = "password"

json = File.read('links.json')
json_object = JSON.parse(json)

json_object.each do |record|
  response = HTTParty.post(url, :query => {:username => username, :password => password, :title => record["title"], :url => record["url"]})
end
