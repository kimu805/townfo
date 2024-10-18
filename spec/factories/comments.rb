FactoryBot.define do
  factory :comment do
    text {"text"}
    association :user
    association :notice
  end
end
