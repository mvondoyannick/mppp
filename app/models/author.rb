class Author < ApplicationRecord
    validates :name, presence: true
    belongs_to :social_network
    has_many :podcasts
    has_one_attached :avatar
    has_rich_text :profil

    def complete_name
        "#{self.name}"
    end
end
