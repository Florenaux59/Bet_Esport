# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'uri'
require 'net/http'
require 'json'

url = URI("https://api.pandascore.co/valorant/teams")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["authorization"] = 'Bearer OFZGCDoGWBUv4oLqD5LJcynh4p0Ad-L-9Ln1HkGA968MmOggmYg'

response = http.request(request)
response_body = response.body
array = JSON.parse(response_body)

# puts "---------------------------début création team valo--------------------------"
# array.each do |team_valo|
#   Team.create(team_name: team_valo["name"])
#   puts Team.all.name
# end
# puts "---------------------------fin création team valo--------------------------"


url2 = URI("https://api.pandascore.co/rl/teams")
http2 = Net::HTTP.new(url2.host, url2.port)
http2.use_ssl = true

request2 = Net::HTTP::Get.new(url2)
request2["accept"] = 'application/json'
request2["authorization"] = 'Bearer OFZGCDoGWBUv4oLqD5LJcynh4p0Ad-L-9Ln1HkGA968MmOggmYg'

response2 = http2.request(request2)
response_body2 = response2.body
array2 = JSON.parse(response_body2)

puts "---------------------------début création team rl--------------------------"
array2.each do |team_rl|
  Team.create(team_name: team_rl["name"])
  puts Team.all.name
end
puts "---------------------------fin création team rl--------------------------"


url3 = URI("https://api.pandascore.co/lol/teams")
http3 = Net::HTTP.new(url3.host, url3.port)
http3.use_ssl = true

request3 = Net::HTTP::Get.new(url3)
request3["accept"] = 'application/json'
request3["authorization"] = 'Bearer OFZGCDoGWBUv4oLqD5LJcynh4p0Ad-L-9Ln1HkGA968MmOggmYg'

response3 = http3.request(request3)
response_body3 = response3.body
array3 = JSON.parse(response_body3)

# puts "---------------------------début création team lol--------------------------"
# array3.each do |team_lol|
#   Team.create(team_name: team_lol["name"])
#   Team.all.name
# end
# puts "---------------------------fin création team lol--------------------------"
