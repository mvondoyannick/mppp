class AddExtraitToPodcast < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :extrait, :text
  end
end
