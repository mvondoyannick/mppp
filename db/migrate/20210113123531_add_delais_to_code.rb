class AddDelaisToCode < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :delais, :string
  end
end
