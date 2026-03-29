FactoryBot.define do
  factory :bike do
    sequence(:name) { |n| "bike#{n}" }
    cruising_distance {100}
    displacement {100}
    association :manufacturer
    association :illustration
  end
end

