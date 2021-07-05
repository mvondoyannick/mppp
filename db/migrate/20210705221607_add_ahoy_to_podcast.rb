class AddAhoyToPodcast < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :ahoy_visit_id, :bigint
  end
end
