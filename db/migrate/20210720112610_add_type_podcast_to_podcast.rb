class AddTypePodcastToPodcast < ActiveRecord::Migration[6.0]
  def change
    add_column :podcasts, :type_podcast, :string
  end
end
