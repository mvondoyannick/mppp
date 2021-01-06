class AddPaysToUserCommand < ActiveRecord::Migration[6.0]
  def change
    add_column :user_commands, :pays, :string
  end
end
