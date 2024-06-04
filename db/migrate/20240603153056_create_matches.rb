class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.integer :odd
      t.date :start_date
      t.references :team1, null: false, foreign_key: { to_table: 'teams' }
      t.references :team2, null: false, foreign_key: { to_table: 'teams' }
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
