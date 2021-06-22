class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address_id, :building, :phone_number, :user_id, :item_id,:token

  #【配送先のバリデーション】&【購入者履歴のバリデーション】
 
  with_options presence: true do  #郵便番号・都道府県・市区町村・番地・電話番号
    validates :post_code
    validates :area_id
    validates :municipalities
    validates :address_id
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 0 } do
    validates :area_id
  end

  #郵便番号の保存には、ハイフンが必須であること
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, massage: 'ハイフンを使用して下さい' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, massage: '10文字以上、11文字以内にして下さい' }


  def save
    #購入履歴を保存する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address_id: address_id, building: building, phone_number: phone_number,purchase_id: purchase.id)
  end


end