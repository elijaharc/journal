FactoryBot.define do
  factory :task do
    item { "Test Item" }
    description { "Lorem Ipsum Item" }
    association :category

    trait :not_started do
        status {'not-started'}
      end

    trait :in_progress do
        status {'in-progress'}
      end

    trait :completed do
        status {'completed'}
      end
  end
end