
FactoryGirl.define do
  factory :album do
    sequence(:title) { |n| "album#{n}" }
  end
end

