require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '商品新規登録できるとき' do
      it 'すべてのblankが埋まっているときに新規登録ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品新規登録できないとき' do
      it '画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が必須であること' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.categoly_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoly can't be blank")
      end
      it '商品の状態の情報が必須であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報が必須であること' do
        @item.payer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payer can't be blank")
      end
      it '発送元の地域の情報が必須であること' do
        @item.place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end
      it '発送までの日数の情報が必須であること' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end
      it '販売価格の記入が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は、¥10000000以上は保存不可であること' do
        @item.price = Faker::Number.number(10_000_000)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格は、¥299以下は保存不可であること' do
        @item.price = Faker::Number.between(from: 0, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格は半角英字が含むと保存できない' do
        @item.price = 'aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '価格は全角文字が含むと保存できない' do
        @item.price = 'ああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
