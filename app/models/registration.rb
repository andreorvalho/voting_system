class Registration < ApplicationRecord
  belongs_to :election
  belongs_to :voter
end
