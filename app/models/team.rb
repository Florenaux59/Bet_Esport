class Team < ApplicationRecord
  has_many :matches_as_1, class_name: "Match", foreign_key: :team1_id, dependent: :destroy
  has_many :matches_as_2, class_name: "Match", foreign_key: :team2_id, dependent: :destroy
  belongs_to :game
end
