class Match < ApplicationRecord
  belongs_to :team1, class_name: "Team", foreign_key: :team1_id
  belongs_to :team2, class_name: "Team", foreign_key: :team2_id
  belongs_to :game

  def infos_match
    {
      id: id,
      game: game.name,
      team1: {
        picture: team1.picture,
        name: team1.team_name,
        odd: odd.match(/(\d\.\d*)\/(\d\.\d*)/)[1]
      },
      team2: {
        picture: team2.picture,
        name: team2.team_name,
        odd: odd.match(/(\d\.\d*)\/(\d\.\d*)/)[2]
      }
    }.to_json

  end


end
