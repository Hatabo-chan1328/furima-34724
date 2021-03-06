require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品購入がうまくいく時' do
      it '全ての項目が正しく入力出来ていれば購入できること' do
        expect(@purchase_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'post_codeが空だと購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'post_codeが半角のハイフンがないと購入できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号は無効です。ハイフン(-)を含んでください")
      end

      it 'prefecture_idが未選択だと購入できないこと' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を選択してください")
      end

      it 'prefecture_id:1では購入できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("都道府県を選択してください")
      end

      it 'city_nameが空だと購入できないこと' do
        @purchase_address.city_name = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'streetが空だと購入できないこと' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空だと購入できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phone_numberが12桁だと購入できないこと' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号が無効です。番号のみ入力してください")
      end

      it 'phone_numberが9桁だと購入できないこと' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号が無効です。番号のみ入力してください")
      end

      it 'phone_numberが英数字混同だと購入できないこと' do
        @purchase_address.phone_number = '090abcd123'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号が無効です。番号のみ入力してください")
      end

      it 'phone_numberが数字のみでないと購入できないこと' do
        @purchase_address.phone_number = '090-123-456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号が無効です。番号のみ入力してください")
      end

      it 'phone_numberが全角文字では購入できないこと' do
        @purchase_address.phone_number = '０９０１２３４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号が無効です。番号のみ入力してください")
      end


      it 'user_idがないと購入出来ないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'item_idがないと購入出来ないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end

      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end
