class Ballot < ApplicationRecord
  belongs_to :election
  has_many :options

  Ballot.inheritance_column = :inheritance_type
end
