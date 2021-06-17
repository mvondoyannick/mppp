class AddNombreCopyToCode < ActiveRecord::Migration[6.0]
  def change
    add_column :codes, :nombre_copy, :integer
    add_column :codes, :rest_copy, :integer
  end
end
