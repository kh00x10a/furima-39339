require 'rails_helper'

RSpec.describe PurchaseRecordShippingDestination, type: :model do
  

  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_shipping_destination = FactoryBot.build(:purchase_record_shipping_destination, user_id: user.id, item_id: item.id)
    end
    context '商品が購入できる場合' do
      it 'post_code、prefecture_id、city、street_address、building_name、phone_number、user_id、item_id、tokenが存在すれば購入できる' do
        expect(@purchase_record_shipping_destination).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @purchase_record_shipping_destination.building_name = ''
        expect(@purchase_record_shipping_destination).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it 'tokenが空では購入できない' do
        @purchase_record_shipping_destination.token = ''
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @purchase_record_shipping_destination.post_code = ''
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeの桁数が間違っていると購入できない' do
        @purchase_record_shipping_destination.post_code = 1111-1111
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeにハイフンが入っていないと購入できない' do
        @purchase_record_shipping_destination.post_code = 1111111
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では購入できない' do
        @purchase_record_shipping_destination.prefecture_id = 1
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_record_shipping_destination.city = ''
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'cityが全角文字以外の文字が入っていると購入できない' do
        @purchase_record_shipping_destination.city = 'さいたまshi'
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("City は全角文字を使用してください")
      end
      it 'street_addressが空では購入できない' do
        @purchase_record_shipping_destination.street_address = ''
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Street address can't be blank")
      end
      it 'street_addressに半角英字が入っていると購入できない' do
        @purchase_record_shipping_destination.street_address = 'saitama1-1-1'
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Street address は半角数字とハイフン、漢字、ひらがな、カタカナのみ入力してください")
      end
      it 'street_addressに全角ハイフンが入っていると購入できない' do
        @purchase_record_shipping_destination.street_address = 'さいたま1―1―1'
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Street address は半角数字とハイフン、漢字、ひらがな、カタカナのみ入力してください")
      end
      it 'street_addressに全角数字が入っていると購入できない' do
        @purchase_record_shipping_destination.street_address = 'さいたま１-１-１'
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Street address は半角数字とハイフン、漢字、ひらがな、カタカナのみ入力してください")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_record_shipping_destination.phone_number = ''
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_nubmerにハイフンが入っていると購入できない' do
        @purchase_record_shipping_destination.phone_number = '000-000-0000'
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberに数字以外のものが入っていると購入できない' do
        @purchase_record_shipping_destination.phone_number = '000aaaa0000'
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberが10桁未満だと購入できない' do
        @purchase_record_shipping_destination.phone_number = '123456789'
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @purchase_record_shipping_destination.phone_number = '123456789012'
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数値で入力してください")
      end
      it 'user_idが紐づいていないと購入できない' do
        @purchase_record_shipping_destination.user_id = nil
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと購入できない' do
        @purchase_record_shipping_destination.item_id = nil
        @purchase_record_shipping_destination.valid?
        expect(@purchase_record_shipping_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
