require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,password,password_confirmation,family_name,first_name,kana_family_name,kana_first_name,birthdayが存在すればユーザーの新規登録ができる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'kana_family_nameが空では登録できない' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaa1'
        @user.password_confirmation = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角文字を含むと登録できない' do
        @user.password = 'aaaaa3あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaaaa1'
        @user.password_confirmation = 'aaaaa2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'kana_family_nameがひらがなでは登録できない' do
        @user.kana_family_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name is invalid')
      end
      it 'kana_first_nameがひらがなでは登録できない' do
        @user.kana_first_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it 'kana_family_nameが漢字では登録できない' do
        @user.kana_family_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name is invalid')
      end
      it 'kana_first_nameが漢字では登録できない' do
        @user.kana_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it 'family_nameが半角英字では登録できない' do
        @user.kana_family_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name is invalid')
      end
      it 'family_nameが半角英字では登録できない' do
        @user.kana_first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
    end
  end
end
