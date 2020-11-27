FactoryBot.define do
  factory :item do
    image {"test"}
    title {"test"}
    intro {"test"}
    category_id {2}
    condition_id {2}
    delivery_id {2}
    prefecture_id {2}
    daycount_id {2}
    price {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end
