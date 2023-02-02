FactoryBot.define do
  factory :ballot do
    name { "Best Ice Cream flavour" }
    type { "multiple-choice" }

    trait(:normal) {
      options {
        [
          build(:option),
          build(:option),
          build(:option)
        ]
      }
    }
    trait(:with_no_options) { options { [] } }
  end
end
