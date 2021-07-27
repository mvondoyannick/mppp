class Podcast < ApplicationRecord
    validates :title, presence: true
    validates :type_podcast_id, presence: true
    validates :extrait, presence: true
    has_one_attached :video_file
    has_one_attached :audio_file
    has_one_attached :pdf_file
    has_rich_text :content_detail
    has_one_attached :cover
    belongs_to :type_podcast

    # integrating ahoy
    #visitable :ahoy_visit
end
