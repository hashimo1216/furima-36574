require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '全て値が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'item_name:空だと保存できないこと' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'description:空だと保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'item_price:空だと保存できないこと' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_price:¥300以下だと保存できないこと' do
        @item.item_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is out of setting range")
      end
      it 'item_price:¥9,999,999以上だと保存できないこと' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is out of setting range")
      end       
      it 'item_price:半角英字の場合は保存はできないこと' do
        @item.item_price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is out of setting range")
      end
      it 'item_price:英数字混合の場合は保存できないこと' do
        @item.item_price = 'aaa12'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is out of setting range")
      end
      it 'item_price:全角数字の場合は保存できないこと' do
        @item.item_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is out of setting range")
      end
      it 'category_id:選択しないと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_id:選択しないと保存できないこと' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_fee_id:選択しないと保存できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'shipping_area_id:選択しないと保存できないこと' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_days_id:選択しないと保存できないこと' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end 
end
