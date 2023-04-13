class Item < ApplicationRecord
    belongs_to :section
    validates :item, presence: true
    validates :name, presence: true
end
