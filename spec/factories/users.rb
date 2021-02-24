FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email {Faker::Internet.email }
    password { 'soccer1572' }
    password_confirmation { 'soccer1572' }
    family_name { '山田' }
    first_name { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_day { '19960705' }
  end
end
