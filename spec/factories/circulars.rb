FactoryBot.define do
  factory :circular do
    title {"title"}
    pdf_file {Faker::Lorem.sentence}
    association :user
    association :group
  end
end
