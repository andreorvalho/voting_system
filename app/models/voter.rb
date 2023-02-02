class Voter < ApplicationRecord
  has_many :elections, through: :registrations
end
