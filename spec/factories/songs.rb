
FactoryGirl.define do
  factory :song do
    sequence(:title) { |n| "song#{n}" }
    association :artist, factory: :artist
    association :album, factory: :album
  end
end
