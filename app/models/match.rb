class Match < ApplicationRecord
  belongs_to :team_1, class_name: "Team", foreign_key: :team1_id
  belongs_to :team_2, class_name: "Team", foreign_key: :team2_id
  belongs_to :game
end
