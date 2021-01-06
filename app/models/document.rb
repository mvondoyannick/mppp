class Document < ApplicationRecord
    validates :name, presence: true
    validates :file, presence: true

    has_one_attached :file
end
