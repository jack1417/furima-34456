require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '#create' do
  
    context '内容に問題ない場合' do
      it '全てのカラムが入力されている状態であれば保存出来る' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題ある場合' do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1では登録できないこと' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1では登録できないこと' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'shipping_cost_idが1では登録できないこと' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
      end
      it 'shipping_day_idが1では登録できないこと' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it 'prefecture_idが0では登録できないこと' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'priceが300から9999999以外では登録出来ないこと' do
        @item.price = '20'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end