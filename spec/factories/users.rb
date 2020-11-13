FactoryBot.define do
  factory :user do
    name {"test"}
    email {Faker::Internet.free_email}
    password {"test0000"}
    password_confirmation {password}
  end
end