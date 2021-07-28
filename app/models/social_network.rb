class SocialNetwork < ApplicationRecord
    validates :name, :logo, presence: true
    has_many :authors
    has_one_attached :logo
end
