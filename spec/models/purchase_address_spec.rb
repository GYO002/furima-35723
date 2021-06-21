require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchasea_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入記録' do
    context '新規登録ができる時' do
      it '新規登録ができるとき' do
        @purchase_address = FactoryBot.build(:purchase_address)
        @purchase_address.valid?
      end
    end
  end

  describe '商品購入記録' do
    context '新規登録ができない時' do

      it '郵便番号が必須であること' do
        @purchasea_address.post_code = ''
        @purchasea_address.valid?
        #binding.pry
        expect(@purchasea_address.errors.full_messages).to include "Post code can't be blank"
      end

      it '都道府県が必須であること' do
        @purchasea_address.area_id = ''
        @purchasea_address.valid?
        #binding.pry
        expect(@purchasea_address.errors.full_messages).to include "Area can't be blank"
      end

      it '市区町村が必須であること' do
        @purchasea_address.municipalities = ''
        @purchasea_address.valid?
        #binding.pry
        expect(@purchasea_address.errors.full_messages).to include "Municipalities can't be blank"
      end

      it '番号が必須であること' do
        @purchasea_address.address_id = ''
        @purchasea_address.valid?
        #binding.pry
        expect(@purchasea_address.errors.full_messages).to include "Address can't be blank"
      end

      it '電話番号が必須であること' do
        @purchasea_address.phone_number = ''
        @purchasea_address.valid?
        #binding.pry
        expect(@purchasea_address.errors.full_messages).to include "Phone number can't be blank"
      end
      
      it '郵便番号の保存にはハイフンが必須であること（123−4567となる）' do
        @purchasea_address.post_code = '0000000'
        @purchasea_address.valid?
        #binding.pry
        expect(@purchasea_address.errors.full_messages).to include "Post code is invalid"
      end

      it '電話番号は11桁以内の数値のみ保存可能なこと（09012345678）' do
        @purchasea_address.phone_number = '000000000000'
        @purchasea_address.valid?
        #binding.pry
        expect(@purchasea_address.errors.full_messages).to include "User can't be blank"
      end

      it 'tokenが空では登録できないこと' do
        @purchasea_address.token = ''
        @purchasea_address.valid?
        #binding.pry
        expect(@purchasea_address.errors.full_messages).to include "Token can't be blank"
      end

    end
  end
end
