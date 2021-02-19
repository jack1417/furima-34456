# テーブル設計

## usersテーブル

| Colum              | Type           | Options        |
| ------------------ || ------------- | -------------- |
| nickname           | string         | null: false    |
| email              | string         | null: false    |
| encrypted_password | string         | null: false    |
| family_name        | string         | null: false    |
| first_name         | string         | null: false    |
| family_name_kana   | string         | null: false    |
| first_name_kana    | string         | null: false    |
| birth_day          | string         | null: false    |

### association

- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy


## productテーブル

| Colum              | Type           | Options                        |
| ------------------ | -------------- | ------------------------------ |
| name               | string         | null: false                    |
| image              | string         | null: false                    |
| price              | string         | null: false                    |
| description        | string         | null: false                    |
| status             | string         | null: false                    |
| shipping_cost      | string         | null: false                    |
| shipping_days      | string         | null; false                    |
| prefecture_id      | integer        | null: false, foreign_key: true |
| category_id        | integer        | null: false, foreign_key: true |
| user_id            | integer        | null: false, foreign_key: true |

### association
- belongs_to :user 


## cardテーブル

| Colum             | Type            | Options                        |
| ----------------- | --------------- | ------------------------------ |
| user_id           | integer         | null: false, foreign_key: true |
| customer_id       | string          | null: false                    |
| card_id           | string          | null* false                    |

### association
- belongs_to :user


## destinationテーブル
| Colum             | Type            | Options                        |
| ----------------- | --------------- | ------------------------------ |
| user_id           | integer         | null: false, foreign_key: true |
| family_name       | string          | null: false                    |
| first_name        | string          | null: false                    |
| family_name_kana  | string          | null: false                    |
| first_name_kana   | string          | null: false                    |
| post_code         | string          | null: false                    |
| prefecture        | string          | null: false                    |
| city              | string          | null: false                    |
| address           | string          | null: false                    |
| building_name     | string          |                                |
| phone_number      | string          |                                |


- belongs_to :user
