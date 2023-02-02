FactoryBot.define do
  factory :option do
    ballot { nil }
    sequence :value do |n|
      "#{n}"
    end
  end
end
