class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,          presence: true
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  validates :family_name,       presence: true
  validates :first_name,        presence: true
  validates :family_name, format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name,  format:{with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_kana,  presence: true
  validates :first_name_kana,   presence: true
  validates :birth_day,         presence: true
end
