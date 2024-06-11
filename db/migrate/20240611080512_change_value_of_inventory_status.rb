class ChangeValueOfInventoryStatus < ActiveRecord::Migration[7.1]
  def change
    change_column_default :inventories, :status, "not_equipped"
  end
end
