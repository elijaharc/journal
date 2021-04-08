FactoryBot.define do
  factory :user do
    username { "test_user" }
    email { "test@email.com" }
    first_name { "first" }
    last_name { "last" }
    password { "password" }
  end
end