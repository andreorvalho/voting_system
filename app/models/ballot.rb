class Ballot < ApplicationRecord
  belongs_to :election

  serialize :options

  Ballot.inheritance_column = :inheritance_type
end
