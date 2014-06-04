
FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "user#{n}@singchana.com" }
    password "password"
    password_confirmation { |u| u.password }
    terms_and_condition "1"
  end

  factory :invalid_user, parent: :user do
    name nil
  end
end
