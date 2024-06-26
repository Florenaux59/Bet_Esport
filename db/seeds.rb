# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "------------------------------------ START ----------------------------------"
Bet.destroy_all
Team.destroy_all
Game.destroy_all
Match.destroy_all
Inventory.destroy_all
Item.destroy_all
User.destroy_all

florent = User.new(email: "flo@gmail.com", password: "password", picture: "default-user", bank: 20000)
florent.save!

nicolas = User.new(email: "nico@gmail.com", password: "password", picture: "default-user", bank: 20000)
nicolas.save!

remi = User.new(email: "remi@gmail.com", password: "password", picture: "default-user", bank: 20000)
remi.save!

require 'uri'
require 'net/http'
require 'json'


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
  request["authorization"] = 'Bearer 7vRRQcJkEazGGW5jcnMWzlQd2ddEOR990EqpheND4F9vWfYGkBM'

  response = http.request(request)
  response_body = response.body
  array = JSON.parse(response_body)
  p array.size

  array.each do |team_vl|
    Team.create!(team_name: team_vl["name"], game: valorant, api_id: team_vl["id"], picture: team_vl["image_url"])
  end
  counter += 1
end
puts "---------------------------fin création team valo--------------------------"

puts "---------------------------création upcoming_match valo --------------------------"
counter = 1
2.times do
  url6 = URI("https://api.pandascore.co/valorant/matches/upcoming?page=#{counter}&per_page=100")

  http6 = Net::HTTP.new(url6.host, url6.port)
  http6.use_ssl = true

  request6 = Net::HTTP::Get.new(url6)
  request6["accept"] = 'application/json'

  request6["authorization"] = 'Bearer 7vRRQcJkEazGGW5jcnMWzlQd2ddEOR990EqpheND4F9vWfYGkBM'

  response6 = http6.request(request6)
  matches_valorant = JSON.parse(response6.read_body)
  p matches_valorant.size

  matches_valorant.each do |match_vl|
    if match_vl["opponents"].present? && match_vl["opponents"][0] && match_vl["opponents"][1]
      team1 = Team.find_by(team_name: match_vl["opponents"][0]["opponent"]["name"])
      team2 = Team.find_by(team_name: match_vl["opponents"][1]["opponent"]["name"])
      Match.create!(team1: team1, team2: team2, start_date: match_vl["begin_at"], game: valorant, api_id: match_vl["id"], odd: "#{rand(1.0..3.0).round(2)}/#{rand(1.0..3.0).round(2)}", status: match_vl["status"], league: match_vl["league"]["name"], serie: match_vl["serie"]["full_name"])
    end
  end
  counter += 1
end
puts "---------------------------fin création upcoming_match valo --------------------------"

puts "---------------------------début création team rl--------------------------"
counter = 1
4.times do
  url2 = URI("https://api.pandascore.co/rl/teams?page=#{counter}&per_page=100")
  http2 = Net::HTTP.new(url2.host, url2.port)
  http2.use_ssl = true

  request2 = Net::HTTP::Get.new(url2)
  request2["accept"] = 'application/json'
  request2["authorization"] = 'Bearer 7vRRQcJkEazGGW5jcnMWzlQd2ddEOR990EqpheND4F9vWfYGkBM'

  response2 = http2.request(request2)
  response_body2 = response2.body
  array2 = JSON.parse(response_body2)
  p array2.size

  array2.each do |team_rl|
    Team.create!(team_name: team_rl["name"], game: rocket, api_id: team_rl["id"], picture: team_rl["image_url"])
  end
  counter += 1
end
puts "---------------------------fin création team rl--------------------------"

puts "---------------------------création upcoming_match rl--------------------------"
url5 = URI("https://api.pandascore.co/rl/matches/upcoming?page=1&per_page=100")

http5 = Net::HTTP.new(url5.host, url5.port)
http5.use_ssl = true

request5 = Net::HTTP::Get.new(url5)
request5["accept"] = 'application/json'

request5["authorization"] = 'Bearer 7vRRQcJkEazGGW5jcnMWzlQd2ddEOR990EqpheND4F9vWfYGkBM'

response5 = http5.request(request5)
matches_rl = JSON.parse(response5.read_body)
p matches_rl.size

matches_rl.each do |match_rl|
  if match_rl["opponents"].present? && match_rl["opponents"][0] && match_rl["opponents"][1]
    team1 = Team.find_by(team_name: match_rl["opponents"][0]["opponent"]["name"])
    team2 = Team.find_by(team_name: match_rl["opponents"][1]["opponent"]["name"])

    Match.create!(team1: team1, team2: team2, start_date: match_rl["begin_at"], game: rocket, api_id: match_rl["id"], odd: "#{rand(1.0..3.0).round(2)}/#{rand(1.0..3.0).round(2)}", status: match_rl["status"], league: match_rl["league"]["name"], serie: match_rl["serie"]["full_name"])
  end
end
puts "---------------------------fin création upcoming_match rl --------------------------"


puts "---------------------------début création team lol--------------------------"
counter = 1
16.times do
  url3 = URI("https://api.pandascore.co/lol/teams?page=#{counter}&per_page=100")
  http3 = Net::HTTP.new(url3.host, url3.port)
  http3.use_ssl = true

  request3 = Net::HTTP::Get.new(url3)
  request3["accept"] = 'application/json'
  request3["authorization"] = 'Bearer 7vRRQcJkEazGGW5jcnMWzlQd2ddEOR990EqpheND4F9vWfYGkBM'

  response3 = http3.request(request3)
  response_body3 = response3.body
  array3 = JSON.parse(response_body3)
  p array3.size
  array3.each do |team_lol|
    Team.create!(team_name: team_lol["name"], game: lol, api_id: team_lol["id"], picture: team_lol["image_url"])
  end
  counter += 1
end
puts "---------------------------fin création team lol--------------------------"


puts "---------------------------création upcoming_match lol --------------------------"
counter = 1
2.times do
  url4 = URI("https://api.pandascore.co/lol/matches/upcoming?page=#{counter}&per_page=100")

  http4 = Net::HTTP.new(url4.host, url4.port)
  http4.use_ssl = true

  request4 = Net::HTTP::Get.new(url4)
  request4["accept"] = 'application/json'

  request4["authorization"] = 'Bearer 7vRRQcJkEazGGW5jcnMWzlQd2ddEOR990EqpheND4F9vWfYGkBM'

  response4 = http4.request(request4)
  matches_lol = JSON.parse(response4.read_body)
  p matches_lol.size

  matches_lol.each do |match_lol|
    if match_lol["opponents"].present? && match_lol["opponents"][0] && match_lol["opponents"][1]
      team1 = Team.find_by(team_name: match_lol["opponents"][0]["opponent"]["name"])
      team2 = Team.find_by(team_name: match_lol["opponents"][1]["opponent"]["name"])
      Match.create!(team1: team1, team2: team2, start_date: match_lol["begin_at"], game: lol,api_id: match_lol["id"], odd: "#{rand(1.0..3.0).round(2)}/#{rand(1.0..3.0).round(2)}", status: match_lol["status"], league: match_lol["league"]["name"], serie: match_lol["serie"]["full_name"])
    end
  end
  counter += 1
end
puts "---------------------------fin création upcoming_match lol --------------------------"


Item.create!(name: "Le Sorcier", picture: "sorcier", price: "5000")
Item.create!(name: "La Princesse", picture: "princesse", price: "6000")
Item.create!(name: "Le Pilote", picture: "racer", price: "2500")
Item.create!(name: "La Policière", picture: "policewoman", price: "8000")
Item.create!(name: "Le Sherlock", picture: "sherlock", price: "6500")
Item.create!(name: "La Japonaise", picture: "japonaise", price: "1500")
Item.create!(name: "Le Combatant", picture: "combatant", price: "5500")
Item.create!(name: "La Footbaleuse", picture: "footbaleuse", price: "10000")
Item.create!(name: "Le Clown", picture: "clown", price: "3000")
Item.create!(name: "La Karateka", picture: "karateka", price: "3500")
Item.create!(name: "Le Capitaine", picture: "capitaine", price: "4000")

p Item.all.size

puts "------------------------------ end ---------------------------------"
