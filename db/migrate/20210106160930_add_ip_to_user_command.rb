class AddIpToUserCommand < ActiveRecord::Migration[6.0]
  def change
    add_column :user_commands, :ip, :string
  end
end
