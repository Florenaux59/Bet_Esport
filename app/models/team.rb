class Team < ApplicationRecord
  has_many :matches_as_1, class_name: "Match", foreign_key: :team1_id
  has_many :matches_as_2, class_name: "Match", foreign_key: :team2_id
  belongs_to :game
end
