class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

         validates :password, format: {with: PASSWORD_REGEX, message: "is invalid. Include both letters and numbers"}
         validates :nick_name, presence: true
         validates :last_name, presence: true
         validates :last_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "is invalid. Input full-width characters"}
         validates :first_name, presence: true
         validates :first_name, presence: true, format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "is invalid. Input full-width characters"}
         validates :last_name_kana, presence: true
         validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "is invalid. Input full-width katakana characters"}
         validates :first_name_kana, presence: true
         validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "is invalid. Input full-width katakana characters"}
         validates :birthday, presence: true

         has_many :items
         #has_many :buys
end
