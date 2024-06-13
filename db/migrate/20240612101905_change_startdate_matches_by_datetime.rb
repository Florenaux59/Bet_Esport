class ChangeStartdateMatchesByDatetime < ActiveRecord::Migration[7.1]
  def change
    change_column(:matches, :start_date, :datetime)
  end
end
