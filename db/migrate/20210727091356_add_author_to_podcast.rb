class AddAuthorToPodcast < ActiveRecord::Migration[6.0]
  def change
    add_reference :podcasts, :author, null: true, foreign_key: true
  end
end
