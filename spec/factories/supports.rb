FactoryBot.define do
  factory :support do
    item     {"机"}
    price    {Faker::Number.between(from: 1, to: 1000000000)}
    reason   {"こんにちは、僕はあれが欲しいです"}
    status   {"北海道にいきたいです"}
    association :user

  end
end
