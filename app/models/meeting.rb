class Meeting < ApplicationRecord
    validates :name, presence: true
    # has_rich_text :exhort_text
end
