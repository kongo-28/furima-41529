class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }

  validates :nickname,         presence: true
  validates :first_name,       presence: true
  validates :family_name,      presence: true
  validates :first_name_kana,  presence: true
  validates :family_name_kana, presence: true
  validates :birthday,         presence: true

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end

  with_options format: { with: /\A[ァ-ヶー]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :family_name_kana
  end

  has_many :items
  has_many :orders
end
