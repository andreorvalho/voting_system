FactoryBot.define do
  factory :election do
    name { "Food Preferences" }

    trait(:normal) { ballots { [build(:ballot, :normal)] } }
    trait(:ballot_with_no_options) { ballots { [build(:ballot, :with_no_options)] } }
  end
end
