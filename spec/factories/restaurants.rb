FactoryBot.define do
  factory :restaurant do
    store_name {"aaaaa"}
    genre_id {2}
    rating_id {2}
    description {"aaaaa"}

    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
