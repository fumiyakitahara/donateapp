FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    transient do
      person { Gimei.name }
    end

    first_name { person.first }
    last_name { person.last }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
    phone_number {"08083830202"}
  end
end