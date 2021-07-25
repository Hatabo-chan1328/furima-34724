FactoryBot.define do
  factory :item do
    name              {"テスト"}
    description       {"テスト"}
    category_id       {2}
    condition_id      {2}
    delivery_fee_id   {2}
    prefecture_id     {2}
    delivery_day_id   {2}
    price             {10000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
