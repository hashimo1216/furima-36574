FactoryBot.define do
  factory :item do
    name                { 'test' }
    description         { 'test' }
    price               { 10000 }
    category_id         { 2 }
    status_id           { 2 }
    delivery_fee_id     { 2 }
    prefecture_id       { 2 }
    shipping_days_id    { 2 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
