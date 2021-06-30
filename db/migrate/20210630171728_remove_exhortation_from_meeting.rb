class RemoveExhortationFromMeeting < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :exhortation, :text
  end
end
