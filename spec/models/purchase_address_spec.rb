require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchasea_address = FactoryBot.build(:purchase_address,user_id: user.id,item_id: item.id)
    sleep 0.1
  end

  describe '商品購入記録' do
    context '新規登録ができる時' do
      it '新規登録ができるとき' do
        expect(@purchasea_address).to be_valid
      end

      it 'buildingが空でも登録できる' do
        @purchasea_address.building = ''
        expect(@purchasea_address).to be_valid
      end
    end
  end

  describe '商品購入記録' do
    context '新規登録ができない時' do

      it '郵便番号が必須であること' do
        @purchasea_address.post_code = ''
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Post code can't be blank"
      end

      it '都道府県が必須であること' do
        @purchasea_address.area_id = ''
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Area can't be blank"
      end

      it '配送元の地域のidに0が選択されている場合は出品できない' do
        @purchasea_address.area_id = 0
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include 'Area must be other than 0'
      end

      it '市区町村が必須であること' do
        @purchasea_address.municipalities = ''
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Municipalities can't be blank"
      end

      it '番号が必須であること' do
        @purchasea_address.address_id = ''
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Address can't be blank"
      end

      it '電話番号が必須であること' do
        @purchasea_address.phone_number = ''
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Phone number can't be blank"
      end
      
      it '郵便番号の保存にはハイフンが必須であること（123−4567となる）' do
        @purchasea_address.post_code = '0000000'
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Post code is invalid"
      end

      it '電話番号は11桁以内の数値のみ保存可能なこと（09012345678）' do
        @purchasea_address.phone_number = '00000000000000'
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号は10桁以上の数値のみ保存可能なこと（09012345678）' do
        @purchasea_address.phone_number = '000000000'
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号は数字のみでないと登録できないこと（英数字混合）' do
        @purchasea_address.phone_number = '00000aaaa'
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Phone number is invalid"
      end

      it '電話番号は数字のみでないと登録できないこと（ハイフンあり）' do
        @purchasea_address.phone_number = '0000-00000'
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Phone number is invalid"
      end

      it '全角文字では登録できないこと' do
        @purchasea_address.phone_number = '００００００００００'
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Phone number is invalid"
      end
      

      it 'tokenが空では登録できないこと' do
        @purchasea_address.token = ''
        @purchasea_address.valid?
        expect(@purchasea_address.errors.full_messages).to include "Token can't be blank"
      end

        it 'Userと紐付いていないと登録できないこと' do
          @purchasea_address.user_id = nil
          @purchasea_address.valid?
          expect(@purchasea_address.errors.full_messages).to include "User can't be blank"
        end

          it 'Itemと紐付いていないと登録できないこと' do
            @purchasea_address.item_id = nil
            @purchasea_address.valid?
            expect(@purchasea_address.errors.full_messages).to include "Item can't be blank"
        end

    end
  end
end
