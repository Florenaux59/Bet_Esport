class AddColumnLeagueStatusAndSerie < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :status, :string
    add_column :matches, :league, :string
    add_column :matches, :serie, :string
  end
end
