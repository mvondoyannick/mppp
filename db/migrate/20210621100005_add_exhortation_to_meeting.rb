class AddExhortationToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :exhortation, :text
  end
end
