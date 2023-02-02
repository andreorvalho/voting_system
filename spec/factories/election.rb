FactoryBot.define do
  factory :election do
    name { "Food Preferences" }
    ballots { [build(:ballot)] }
  end
end
