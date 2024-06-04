class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :logo
      t.string :picture

      t.timestamps
    end
  end
end
