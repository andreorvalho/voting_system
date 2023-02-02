class Election < ApplicationRecord
  has_many :ballots
  has_many :voters, through: :registrations
end
