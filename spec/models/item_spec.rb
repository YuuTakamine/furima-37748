require 'rails_helper'
 RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

   describe "商品出品機能" do

    context '商品が出品できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'category:必須' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it "product_condition:必須" do
        @item.product_condition_id = 2
        expect(@item).to be_valid
      end
      it "delivery_borden:必須" do
        @item.delivery_borden_id = 2
        expect(@item).to be_valid
      end
      it "sipping_area:必須" do
        @item.sipping_area_id = 2
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it 'image:必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_name:必須" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_explanation:必須" do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it 'category:必須' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "product_condition:必須" do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it "delivery_borden:必須" do
        @item.delivery_borden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery borden can't be blank")
      end
      it "sipping_area:必須" do
        @item.sipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping area can't be blank")
      end
      it "price:必須" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "price:半角数値のみ保存可能" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it "price:¥300未満は保存できない" do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "price:¥¥9,999,999より上は保存できない" do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end