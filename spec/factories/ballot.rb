FactoryBot.define do
  factory :ballot do
    name { "Best Ice Cream flavour" }
    type { "multiple-choice" }
    options { [
      "Vanilla",
      "Chocolate",
      "Strawberry",
      "Cookie Dough"
    ] }
  end
end
