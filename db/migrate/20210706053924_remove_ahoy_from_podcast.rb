class RemoveAhoyFromPodcast < ActiveRecord::Migration[6.0]
  def change
    remove_column :podcasts, :ahoy_visit_id, :bigint
  end
end
