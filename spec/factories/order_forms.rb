FactoryBot.define do
  factory :order_form do
    transient do
      user { create(:user) }
      item { create(:item) }
    end

    post_code      { "333-3333" }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipality   { Faker::Name.last_name }
    street_address { Faker::Number.between(from: 1, to: 100) }
    building       { Faker::Name.last_name }
    phone_number   { Faker::Number.between(from: 1000000000, to: 99999999999) }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end



