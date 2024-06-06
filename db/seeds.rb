# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'uri'
require 'net/http'
require 'json'

Team.destroy_all
Game.destroy_all
valorant = Game.create!(name: "Valorant", slug: "valorant")
rocket = Game.create!(name: "Rocket League", slug: "rl")
lol = Game.create!(name: "League of Legends", slug: "league-of-legends")

puts "---------------------------début création team valo--------------------------"
counter = 1
14.times do
  url = URI("https://api.pandascore.co/valorant/teams?page=#{counter}&per_page=100")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["authorization"] = 'Bearer OFZGCDoGWBUv4oLqD5LJcynh4p0Ad-L-9Ln1HkGA968MmOggmYg'

  response = http.request(request)
  response_body = response.body
  array = JSON.parse(response_body)
  p array.size

  array.each do |team_valo|
    Team.create(team_name: team_valo["name"], game: valorant)
  end
  counter += 1
end
puts "---------------------------fin création team valo--------------------------"

puts "---------------------------début création team rl--------------------------"
counter = 1
4.times do
  url2 = URI("https://api.pandascore.co/rl/teams?page=#{counter}&per_page=100")
  http2 = Net::HTTP.new(url2.host, url2.port)
  http2.use_ssl = true

  request2 = Net::HTTP::Get.new(url2)
  request2["accept"] = 'application/json'
  request2["authorization"] = 'Bearer OFZGCDoGWBUv4oLqD5LJcynh4p0Ad-L-9Ln1HkGA968MmOggmYg'

  response2 = http2.request(request2)
  response_body2 = response2.body
  array2 = JSON.parse(response_body2)
  p array2.size

  array2.each do |team_rl|
    Team.create(team_name: team_rl["name"], game: rocket)
  end
  counter += 1
end
puts "---------------------------fin création team rl--------------------------"

puts "---------------------------début création team lol--------------------------"
counter = 1
16.times do
  url3 = URI("https://api.pandascore.co/lol/teams?page=#{counter}&per_page=100")
  http3 = Net::HTTP.new(url3.host, url3.port)
  http3.use_ssl = true

  request3 = Net::HTTP::Get.new(url3)
  request3["accept"] = 'application/json'
  request3["authorization"] = 'Bearer OFZGCDoGWBUv4oLqD5LJcynh4p0Ad-L-9Ln1HkGA968MmOggmYg'

  response3 = http3.request(request3)
  response_body3 = response3.body
  array3 = JSON.parse(response_body3)
  p array3.size
  array3.each do |team_lol|
    Team.create(team_name: team_lol["name"], game: lol)
  end
  counter += 1
end
puts "---------------------------fin création team lol--------------------------"


puts "---------------------------création match --------------------------"

url4 = URI("https://api.pandascore.co/lol/matches/upcoming")

http4 = Net::HTTP.new(url4.host, url4.port)
http4.use_ssl = true

request4 = Net::HTTP::Get.new(url4)
request4["accept"] = 'application/json'

request4["authorization"] = 'Bearer OFZGCDoGWBUv4oLqD5LJcynh4p0Ad-L-9Ln1HkGA968MmOggmYg'

response4 = http4.request(request4)
matches = JSON.parse(response4.read_body)


matches.each do |match|
  team1 = Team.find_by(team_name: match["opponents"][0]["opponent"]["name"])
  p "VERSUS"
  team2 = Team.find_by(team_name: match["opponents"][1]["opponent"]["name"])
  Match.create!(team1: team1, team2: team2, start_date: match["begin_at"], game: lol)
  puts "--------------------------------------------------"
end
puts "---------------------------fin création match --------------------------"
