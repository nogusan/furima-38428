require 'rails_helper'

RSpec.describe OrderShipAddress, type: :model do
  describe 'user購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_ship_address = FactoryBot.build(:order_ship_address, user_id: user.id, item_id: item.id)
      sleep 0.05
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_ship_address).to be_valid
      end
      it 'build_nameが空でも保存ができること' do
        @order_ship_address.build_name = nil
        expect(@order_ship_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'userが紐付いてないと保存ができないこと' do
        @order_ship_address.user_id = nil
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いてないと保存ができないこと' do
        @order_ship_address.item_id = ''
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_ship_address.token = nil
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postが空だと保存できないこと' do
        @order_ship_address.post = ''
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Post can't be blank")
      end
      it 'postが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_ship_address.post = '1234567'
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include('Post is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'delivery_idを選択していないと保存できないこと' do
        @order_ship_address.delivery_id = 1
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_ship_address.city = ''
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("City can't be blank")
      end
      it 'lineが空だと保存できないこと' do
        @order_ship_address.line = ''
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Line can't be blank")
      end
      it 'tellが空だと保存できないこと' do
        @order_ship_address.tell = ''
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tellが半角数字のみでないと保存できないこと' do
        @order_ship_address.tell = '333-3333-3333'
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include('Tell is invalid. Input only number')
      end
      it 'tellが9字以下だと保存できないこと' do
        @order_ship_address.tell = 123_456_789
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include('Tell is too short')
      end
      it 'tellが12字以上だと保存できないこと' do
        @order_ship_address.tell = 123_456_789_123
        @order_ship_address.valid?
        expect(@order_ship_address.errors.full_messages).to include('Tell is too short')
      end
    end
  end
end
