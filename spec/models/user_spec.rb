require 'rails_helper'
 RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
    it 'nick_name:必須' do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
     it "email:必須" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'emaiが一意性である' do
      @user.email = "@user.dup"
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
     it 'emaiは@を含む必要がある' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it "password:必須" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "password:6文字以上での入力が必須" do
      @user.password = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "password:半角英数字混合での入力が必須" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "password_confirmation:値の一致が必須" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "お名前(全角)は、名字と名前がそれぞれ必須" do
      @user.last_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank","First name can't be blank")
     end
     it "お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須" do
      @user.last_name = 'takahasi'
      @user.first_name = 'yuta'
      @user.valid?
     end
     it "お名前カナ(全角)は、名字と名前がそれぞれ必須" do
      @user.last_name_kana = ''
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid. Input full-width katakana characters", "First name kana can't be blank", "First name kana is invalid. Input full-width katakana characters")
     end
     it "お名前カナ(全角)は、全角（カタカナ）での入力が必須" do
      @user.last_name_kana = '高橋'
      @user.first_name_kana = '悠太'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters", "First name kana is invalid. Input full-width katakana characters")
     end
     it "生年月日が必須" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
   end
 end