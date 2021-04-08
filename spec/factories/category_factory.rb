FactoryBot.define do
  factory :category do
    category_name { "Test Journal" }
    description { "Lorem Ipsum" }
    association :user
  end
end