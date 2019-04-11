class Player < ApplicationRecord
  has_many :touchdowns
  belongs_to :team
  validates :name, {
    presence: true,
    uniqueness: true
  }
end
