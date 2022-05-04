require 'rails_helper'
 RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

   describe "ユーザー新規登録" do
    it 'nick_name:必須' do
      @user.nick_name = ''
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("can't be brank")
    end
     it "emailが空では登録できない" do
     end
   end
 end