class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_day, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
  with_options presence: true do
    validates :first_name_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :last_name_kanji, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: 'is invalid. Input full-width katakana characters' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶ一]+\z/, message: 'is invalid. Input full-width katakana characters' }
  end

  has_many :items
  has_many :orders
end
