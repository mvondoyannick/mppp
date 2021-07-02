class AddLangToMeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :lang, :string
  end
end
