class AddBankColumnToUserTable < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bank, :integer
  end
end
