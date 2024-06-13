class AddDefaultValueToUserTable < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :bank, 20_000
    change_column_default :users, :picture, "default-user.png"
  end
end
