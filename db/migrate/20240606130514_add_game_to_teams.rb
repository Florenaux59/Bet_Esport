class AddGameToTeams < ActiveRecord::Migration[7.1]
  def change
    add_reference :teams, :game, null: false, foreign_key: true
  end
end