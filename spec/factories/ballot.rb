FactoryBot.define do
  factory :ballot do
    name { "Best Ice Cream flavour" }
    type { "multiple-choice" }
    options {
      [
        build(:option),
        build(:option),
        build(:option)
      ]
    }
  end
end
