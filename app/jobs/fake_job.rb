class FakeJob < ApplicationJob
  queue_as :default
  require 'uri'
  require 'net/http'
  require 'json'

  def perform
    # counter = 0
    Match.all.each do |match|
      if match.status == "not_started" && match.start_date < Time.now
        # counter += 1
        # p counter

        url = URI("https://api.pandascore.co/matches/#{match.api_id}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["accept"] = 'application/json'

       request["authorization"] = 'Bearer 7vRRQcJkEazGGW5jcnMWzlQd2ddEOR990EqpheND4F9vWfYGkBM'

        response = http.request(request)




        # http = Net::HTTP.new(url.host, url.port)
        # http.use_ssl = true

        # request = Net::HTTP::Get.new(url)
        # request["accept"] = 'application/json'
        # request["authorization"] = 'Bearer 7vRRQcJkEazGGW5jcnMWzlQd2ddEOR990EqpheND4F9vWfYGkBM'

        data = JSON.parse(response.read_body)

        # puts data
        if data["results"].size > 0
          match.update!(status:data["status"], score_team1:data["results"][0]["score"] , score_team2:data["results"][1]["score"])
        end
      end
    end
  end
end
