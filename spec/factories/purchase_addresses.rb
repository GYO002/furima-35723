FactoryBot.define do
  factory :purchase_address do

    post_code             { '000-0000' }
    area_id               { 2 }
    municipalities        { 'テスト' }
    address_id            { '0000' }
    phone_number          { '00000000000' }
  
    
  end
end
