FactoryGirl.define do
  factory :item do
    title Faker::Lorem.word
    inventory Faker::Number.between(1, 15)
    price Faker::Number.decimal(2)
  end
end
