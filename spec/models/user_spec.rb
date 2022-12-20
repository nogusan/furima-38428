require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべてのblankが埋まっている時、新規登録ができる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameは必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailは必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性であること' do
        @user.email = 'aaa@aaa'
        @user.save
        user1 = FactoryBot.build(:user)
        user1.email = 'aaa@aaa' 
        user1.valid?
        expect(user1.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailには@を含むこと' do
        @user.email = 'aaaaaa' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordは必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'aaaa5'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'bbbbbb' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'お名前(全角名字）が必須であること' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
      it 'お名前(全角名前）が必須であること' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name_kanji = 'aa'
        @user.first_name_kanji = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid. Input full-width characters", "Last name kanji is invalid. Input full-width characters")
      end
      it 'お名前カナ(全角名字）が必須であること。' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角名前）が必須であること。' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = '嗚呼'
        @user.first_name_kana = 'ああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters", "Last name kana is invalid. Input full-width katakana characters")
      end
      it '生年月日が必須であること' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
