class Event < ApplicationRecord
  has_secure_password
  has_many :sections
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
end
