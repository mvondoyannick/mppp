class AddUsedToCode < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :used, :boolean
  end
end
