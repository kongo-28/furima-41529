FactoryBot.define do
  factory :item do
    association :user
    name { Faker::Name.last_name }
    explanation { Faker::Lorem.paragraph }
    category_id   { Faker::Number.between(from: 2, to: 11) }
    condition_id  { Faker::Number.between(from: 2, to: 8) }
    fee_id        { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    period_id     { Faker::Number.between(from: 2, to: 4) }
    price         { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
