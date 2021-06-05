require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'hogehoge.hogehoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
      @user.password = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa112'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa112'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは全角文字では登録できない' do
      @user.password = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe '新規登録/本人情報確認' do
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること（名字）' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること（名前）' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(名字）' do
      @user.last_name = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること（名前）' do
      @user.first_name = '1111'
      @user.valid?

      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
    end

    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名字）' do
      @user.last_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
    end

    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること(名前）' do
      @user.first_name_ruby = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name ruby can't be blank")
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること(名字）' do
      @user.last_name_ruby = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name ruby 全角(カタカナ）を使用してください')
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること（名前）' do
      @user.first_name_ruby = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name ruby 全角(カタカナ）を使用してください')
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
