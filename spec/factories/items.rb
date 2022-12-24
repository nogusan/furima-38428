FactoryBot.define do
  factory :item do

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    item_name { Faker::ProgrammingLanguage.name }
    content { Faker::Lorem.sentence}
    price { Faker::Number.between(from: 300, to: 9999999 ) }
    categoly_id { Faker::Number.between(from: 2, to: 11 ) }
    status_id { Faker::Number.between(from: 2, to: 8 ) }
    payer_id { Faker::Number.between(from: 2, to: 3 ) }
    delivery_id { Faker::Number.between(from: 2, to: 48 ) }
    place_id { Faker::Number.between(from: 2, to: 4 ) }

    association :user

  end
end
