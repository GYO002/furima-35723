require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
   context '商品出品ができる時' do
       it '商品出品ができる時' do
         @item = FactoryBot.build(:item)
         @item.valid?
        end
   end
  end
  
  context '商品出品ができない時' do
    it '商品画像を１枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end

    it '商品名が必須であること' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product name can't be blank"
    end

    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end


    it '商品の状態についての情報が必須であること' do
      @item.status_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end

    it '配送料の負担についての情報が必須であること' do
      @item.burden_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end

    it '配送元の地域の情報が必須であること' do
      @item.area_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end

    it '配送までの日数についての情報が必須であること' do
      @item.delivery_day_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end

    it 'idに1が選択されている場合は出品できない' do
      item = Item.new(category_id: 1)
      item = Item.new(status_id: 1)
      item = Item.new(burden_id: 1)
      item = Item.new(delivery_day_id: 1)
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end


    it '(配送先地域の（area)場合はidが0の時は出品できない)' do
      item = Item.new(area_id: 0)
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
    end

    it '配送価格についての情報が必須であること' do
      @item.price=''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price 半角¥300~¥9,999,999の間でお願いします"
    end

    it '商品価格が299円以下では出品できない' do
      item = Item.new(price: 200)
      item.valid?
      expect(item.errors.full_messages).to include "Price 半角¥300~¥9,999,999の間でお願いします"
    end

    it '商品価格が10_000_000円以上では出品できない' do
      item = Item.new(price: 100000000)
      item.valid?
      expect(item.errors.full_messages).to include "Price 半角¥300~¥9,999,999の間でお願いします"
    end

    it '販売価格は半角数字のみ保存可能であること' do
      item = Item.new(price: '１００')
      item.valid?
      expect(item.errors.full_messages).to include "Price 半角¥300~¥9,999,999の間でお願いします"
    end

    it '商品価格が半角英数字混合では出品できない' do
      item = Item.new(price: '111aaa')
      item.valid?
      expect(item.errors.full_messages).to include "Price 半角¥300~¥9,999,999の間でお願いします"
    end

    it '商品価格が半角英字のみでは出品できない' do
      item = Item.new(price: 'aaaaa')
      item.valid?
      expect(item.errors.full_messages).to include "Price 半角¥300~¥9,999,999の間でお願いします"
    end

  end
end