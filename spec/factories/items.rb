FactoryBot.define do
  factory :item do
    name             { 'イラスト'}
    description      { Faker::Lorem.sentence}
    category_id      { Faker::Number.within(range: 2..10)}
    status_id        { Faker::Number.within(range: 2..10)}
    prefecture_id    { Faker::Number.within(range: 2..10)}
    shipping_cost_id { Faker::Number.within(range: 2..10)}
    shipping_day_id  { Faker::Number.within(range: 2..10)}
    price            { Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test1.png'), filename: 'test1.png')
    end
  end
end
