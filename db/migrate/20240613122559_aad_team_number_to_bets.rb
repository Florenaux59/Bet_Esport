class AadTeamNumberToBets < ActiveRecord::Migration[7.1]
  def change
    add_column :bets, :team_number, :integer
  end
end
