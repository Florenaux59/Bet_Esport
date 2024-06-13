class ChangeValueOfScoreteam < ActiveRecord::Migration[7.1]
  def change
    change_column :matches, :score_team1, :integer, using: 'score_team1::integer'
    change_column :matches, :score_team2, :integer, using: 'score_team2::integer'
  end
end
