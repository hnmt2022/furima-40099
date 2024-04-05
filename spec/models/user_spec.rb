require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目に正しく入力すると登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it '@を含まないemailでは登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '5文字以下のpasswordでは登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '半角英のみのpasswordでは登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '半角数のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it '全角を含むpasswordでは登録できない' do
        @user.password = 'a１２３４５６'
        @user.password_confirmation = 'a１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードとパスワード（確認）が一致しないと登録できない' do
        @user.password = '678901a'
        @user.password_confirmation = '123457b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '名字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '半角の名字では登録できない' do
        @user.last_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end

      it '半角の名前では登録できない' do
        @user.first_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end

      it '名字（カナ）が空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it '名前（カナ）が空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it '名字（カナ）が半角では登録できない' do
        @user.kana_last_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name kana is invalid. Input full-width katakana characters')
      end

      it '名前（カナ）が半角では登録できない' do
        @user.kana_first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name kana is invalid. Input full-width katakana characters')
      end

      it '名字（カナ）が平仮名では登録できない' do
        @user.kana_last_name = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name kana is invalid. Input full-width katakana characters')
      end

      it '名前（カナ）が平仮名では登録できない' do
        @user.kana_first_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name kana is invalid. Input full-width katakana characters')
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
