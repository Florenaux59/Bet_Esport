class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :picture

      t.timestamps
    end
  end
end
