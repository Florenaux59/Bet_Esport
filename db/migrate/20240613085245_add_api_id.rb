class AddApiId < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :api_id, :integer
  end
end
