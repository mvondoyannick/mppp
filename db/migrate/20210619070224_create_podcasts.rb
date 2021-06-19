class CreatePodcasts < ActiveRecord::Migration[6.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.datetime :date_creation
      t.string :content

      t.timestamps
    end
  end
end
