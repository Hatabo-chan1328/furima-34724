require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item )
    end

    context '商品出品ページへ登録出来ること' do
      it '全ての項目が存在すれば登録できること' do
        expect(@item).to be_valid
      end

      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @item = FactoryBot.create(:user)
        expect(@item).to be_valid
      end

    end

    context '商品出品ページへ登録出来ないこと' do
      it 'nameが空では登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'descriptionが空では登録できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'condition_idが空では登録できないこと' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it 'delivery_fee_idが空では登録できないこと' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it 'prefecture_idが空では登録できないこと' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を選択してください")
      end

      it 'delivery_day_idが空では登録できないこと' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'priceについての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end

      it 'priceは、¥299以下では登録出来ないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を設定範囲内にしてください")
      end

      it 'priceは、¥10_000_000円以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を設定範囲内にしてください")
      end


      it 'priceは半角数字のみ出品可能であること' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を半角数字にしてください")
      end

      it 'priceは半角英字のみでは出品できないこと' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を半角数字にしてください")
      end

      it 'priceは半角英字混合では出品できないこと' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を半角数字にしてください")
      end

      it 'condition_id:1では出品できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it 'category_id:1では出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end

      it 'delivery_fee_id:1では出品できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end

      it 'delivery_day_id:1では出品できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it 'prefecture_id:1では出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を選択してください")
      end

      it 'user_idがないと登録出来ないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end

    end
  end
end

 