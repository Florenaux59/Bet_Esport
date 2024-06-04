class CreateBets < ActiveRecord::Migration[7.1]
  def change
    create_table :bets do |t|
      t.integer :place_money
      t.integer :gain
      t.date :end_date
      t.string :status
      t.references :match, null: false, foreign_key: true
      t.timestamps
    end
  end
end
