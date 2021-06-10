FactoryBot.define do
  factory :item do

    product_name          {'test'}
    description           {'test'}
    category_id              {2}
    status_id                {2}
    burden_id                {2}
    area_id                  {2}
    delivery_day_id          {2}
    price                 {3000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

end
