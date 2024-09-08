require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order = FactoryBot.build(:order_form)
  end

  describe '商品購入情報購入' do
    context '購入できる場合' do
      it '全ての値が正しく入力できていれば購入できる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '購入できない場合' do
      it '郵便番号が空では購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it 'prefecture_idが1では購入できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空では購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'street_addressが空では購入できない' do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空では購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeがxxx-xxxxの形式でないと購入できない' do
        @order.post_code = '333'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code xxx-xxxxの形式で入力してください')
      end

      it 'phone_numbeが9桁以下では購入できない' do
        @order.phone_number = 123456789
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number 10桁か11桁の半角数値で入力してください')
      end

      it 'phone_numbeが12桁以上では購入できない' do
        @order.phone_number = 123456789123
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number 10桁か11桁の半角数値で入力してください')
      end

      it 'phone_numbeに半角数字以外が含まれていれば購入できない' do
        @order.phone_number = 12345-67890
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number 10桁か11桁の半角数値で入力してください')
      end

      it 'phone_numbeに半角数字以外が含まれていれば購入できない' do
        @order.phone_number = 12345-67890
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number 10桁か11桁の半角数値で入力してください')
      end

      it 'user_idが空では購入できない' do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'user_idが空では購入できない' do
        @order.item_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
