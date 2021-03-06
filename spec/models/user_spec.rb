require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context '新規登録できるとき' do
      it '全て値が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nickname:空だと登録できないとき' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'email:空だと登録できないとき' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'email:重複した場合登録できないとき' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'email:@が入ってないと登録できないとき' do
        @user.email = 'testsample'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'password:空だと登録できないとき' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password:6文字以上入力しないと登録できないとき' do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password:半角英字のみだと登録できないとき' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'password:半角数字のみだと登録できないとき' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'password:password_confirmationとの、値の一致しないと登録できないとき' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前:family_nameが空だと登録できないとき' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'お名前:first_nameが空だと登録できないとき' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前:family_nameは全角（漢字・ひらがな・カタカナ）で入力しないと登録できないとき' do
        @user.family_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
      end
      it 'お名前:first_nameは全角（漢字・ひらがな・カタカナ）で入力しないと登録できないとき' do
        @user.first_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
      end
      it 'お名前:family_name_kanaが空だと登録できないとき' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'お名前:first_name_kanaが空だと登録できないとき' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前:family_name_kanaは全角（カタカナ）で入力しないと登録できないとき' do
        @user.family_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters.')
      end
      it 'お名前:first_name_kanaは全角（カタカナ）で入力しないと登録できないとき' do
        @user.first_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
      end
      it 'birth_day:空だと登録できないとき' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
