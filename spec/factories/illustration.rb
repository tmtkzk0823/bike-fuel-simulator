FactoryBot.define do
  factory :illustration do
    sequence(:body_image) { |n| "body_image#{n}" }
    sequence(:whieel_image) { |n| "whieel_image#{n}" }
  end
end

