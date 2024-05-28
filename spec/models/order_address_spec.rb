require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id)
    sleep (1)
  end

  describe '商品購入情報の保存' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      it 'tel_numberが10桁であれば保存できる' do
        @order_address.tel_number = '1234567890'
        expect(@order_address).to be_valid
      end
      it 'tel_numberが11桁であれば保存できる' do
        @order_address.tel_number = '12345678901'
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空では保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecre_idが1では保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では保存できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空では保存できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'tel_numberが空では保存できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'post_codeに-がないと保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'tel_numberに-があると保存できない' do
        @order_address.tel_number = '111-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel number is invalid')
      end
    end
  end
end
