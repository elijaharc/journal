FactoryBot.define do
  factory :task do
    item { "Test Item" }
    description { "Lorem Ipsum Item" }
    association :category

    factory :not_started do
        status {'not-started'}
      end

    factory :in_progress do
        status {'in-progress'}
      end

    factory :completed do
        status {'completed'}
      end
  end
end