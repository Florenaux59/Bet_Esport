class ChangeColumnOddToString < ActiveRecord::Migration[7.1]
  def change
    change_column :matches, :odd, :string
  end
end
