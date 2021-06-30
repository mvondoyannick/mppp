class Meeting < ApplicationRecord
    validates :name, presence: true
    has_rich_text :exhortation
end
