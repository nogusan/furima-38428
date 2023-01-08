FactoryBot.define do
  factory :order do
    association :users
    association :items
  end
end
