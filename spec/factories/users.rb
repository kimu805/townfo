FactoryBot.define do
  factory :user do
    nickname              {"sample"}
    email                 {"sample@sample.com"}
    password              {"111111"}
    password_confirmation {password}
  end
end
