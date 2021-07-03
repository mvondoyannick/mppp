class Meeting < ApplicationRecord
    validates :name, presence: true
    validates :lang, presence: {message: "Selectionner la langue correspondante à la publication"}
    has_rich_text :exhortation
    has_one_attached :audio
end
