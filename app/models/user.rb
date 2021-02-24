class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
          validates :nickname
          validates :family_name
          validates :first_name
          validates :family_name_kana
          validates :first_name_kana
          validates :birth_day
  end
  
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :first_name,  format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }
end
