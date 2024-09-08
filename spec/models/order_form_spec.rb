require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order = FactoryBot.build(:order_form)
  end

  describe '商品購入情報登録' do
    context '登録できる場合' do
      it '全ての値が正しく入力できていれば登録できる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも登録できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '登録できない場合' do
      it '郵便番号が空では登録できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'prefecture_idが1では登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空では登録できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'street_addressが空では登録できない' do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空では登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeがxxx-xxxxの形式でないと登録できない' do
        @order.post_code = '333'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code xxx-xxxxの形式で入力してください')
      end

      it 'phone_numbeが10桁か11桁の数値でないと登録できない' do
        @order.phone_number = 333
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number 10桁か11桁の半角数値で入力してください')
      end
    end
  end
end
