class Section < ApplicationRecord
    belongs_to :event
    has_many :items
    validates :name, presence: true
end
