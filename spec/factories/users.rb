FactoryBot.define do
  factory :user do
      nickname {Faker::Name.last_name}
      email {Faker::Internet.email}
      password {Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      first_name {"いい"}
      family_name {"ああ"}
      first_name_kana {"うう"}
      family_name_kana {"ええ"}
      birthday {Faker::Date.birthday}

  end
  end