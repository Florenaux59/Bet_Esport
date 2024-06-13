class FakeJob < ApplicationJob
  queue_as :default
  require 'uri'
  require 'net/http'
  require 'json'

  # def perform
  #   Match.first.each do |match|

  #   url = URI("https://api.pandascore.co/matches/#{match.api_id}")

  #   http = Net::HTTP.new(url.host, url.port)
  #   http.use_ssl = true

  #   request = Net::HTTP::Get.new(url)
  #   request["accept"] = 'application/json'
  #   request["authorization"] = 'Bearer OFZGCDoGWBUv4oLqD5LJcynh4p0Ad-L-9Ln1HkGA968MmOggmYg'

  #   response = http.request(request)
  #   puts response.read_body
  #   match.update!(status: response.read_body["status"], winner_id: response.read_body["winner"]["id"])
  #   end
  # end
end
