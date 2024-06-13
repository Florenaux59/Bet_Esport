class AddWinnerIdColumnToMatches < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :winner_id, :integer
  end
end
