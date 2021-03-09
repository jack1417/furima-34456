require 'rails_helper'

RSpec.describe OrderDestination, type: :model do

  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '商品の購入ができる時'do
      it '全ての情報を入力すると購入ができる時' do 
        expect(@order_destination).to be_valid
      end

      it '建物の情報がなくても保存ができる時' do
        @order_destination.building_name = ''
        @order_destination.valid?
        expect(@order_destination).to be_valid
      end
    end

    context '商品の購入ができない時'do
      it '郵便番号にハイフンがないと保存できない時' do 
        @order_destination.post_code = '2222222'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号が空だと保存できない時' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end

      it '都道府県を選択しないと保存できない時' do 
        @order_destination.prefecture_id = 0
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it '市町村が空だと保存できない時' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end

      it '番地空だと保存できない時' do 
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと保存できない時' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号に数値以外が含まれていると保存できない時' do
        @order_destination.phone_number = 'ai099993333'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が十一桁だと保存できない時' do
        @order_destination.phone_number = '090999933333'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが空だと保存できない時' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できない時' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
