class CreateUserCommands < ActiveRecord::Migration[6.0]
  def change
    create_table :user_commands do |t|
      t.string :name
      t.string :second_name
      t.string :email
      t.string :nombre

      t.timestamps
    end
  end
end
