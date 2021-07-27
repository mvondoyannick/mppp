class AddTypePodcastsToPodcast < ActiveRecord::Migration[6.0]
  def change
    add_reference :podcasts, :type_podcast, null: true, foreign_key: true
  end
end
