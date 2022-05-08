FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/23120716_m.jpg'), filename: '23120716_m.jpg')
    end
    item_name            {'test'}
    item_explanation     {'test'}
    category_id             {4}
    product_condition_id    {5}
    delivery_borden_id      {3}
    sipping_area_id         {5}
    days_to_ship_id         {6}
    price                {1000}
  end
end