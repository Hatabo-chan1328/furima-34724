require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

   context 'ユーザー登録ができるとき' do
    it '全ての項目が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上で英数字の組み合わせであれば登録できること' do
      @user.password = 'aaa4567'
      @user.password_confirmation = 'aaa4567'
      expect(@user).to be_valid
    end
   end

   context 'ユーザー登録ができない時' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'password_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください")
    end

    it 'last_nameが英文字では登録できないこと' do
      @user.last_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓には全角文字を使用してください")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名を入力してください")
    end

    it 'first_nameが英文字では登録できないこと' do
      @user.first_name = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名には全角文字を使用してください")
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）を入力してください")
    end

    it 'last_name_kanaが英文字では登録できないこと' do
      @user.last_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）には全角カタカナを使用してください")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名(カナ)を入力してください")
    end

    it 'first_name_kanaが英文字では登録できないこと' do
      @user.first_name_kana = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名(カナ)には全角カタカナを使用してください")
    end

    it 'birth_dayが空では登録できないこと' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'passwordが数字のみの場合登録できないこと' do
      @user.password = '1234567'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end

    it 'passwordが英文字のみの場合登録できないこと' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'aaa4567'
      @user.password_confirmation = 'aaa4568'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'emailに@がない場合は登録できないこと' do
      @user.email = 'sample.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'last_name_kanaがひらがなの場合は登録できないこと' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）には全角カタカナを使用してください")
    end

    it 'last_name_kanaが英文字の場合は登録できないこと' do
      @user.last_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓（カナ）には全角カタカナを使用してください")
    end

    it 'first_name_kanaがひらがなの場合は登録できないこと' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("名(カナ)には全角カタカナを使用してください")
    end

    it 'first_name_kanaが英文字の場合は登録できないこと' do
      @user.first_name_kana = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("名(カナ)には全角カタカナを使用してください")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'aa345'
      @user.password_confirmation = 'aa345'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it 'passwordが全角であれば登録できないこと' do
      @user.password = 'アイウエオ'
      @user.password_confirmation = 'アイウエオ'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end

   end


  end
end
