class AddExpireToCode < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :expire, :datetime
  end
end
