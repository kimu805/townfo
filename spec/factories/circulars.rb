FactoryBot.define do
  factory :circular do
    title {"title"}
    association :user
    association :group
  end
end
