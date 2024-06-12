class AddColumnScore < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :score_team1, :string
    add_column :matches, :score_team2, :string
  end
end
