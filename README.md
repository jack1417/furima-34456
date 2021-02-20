# テーブル設計

## usersテーブル

| Colum              | Type           | Options                  |
| ------------------ || ------------- | ------------------------ |
| nickname           | string         | null: false              |
| email              | string         | null: false, unique:true |
| encrypted_password | string         | null: false              |
| family_name        | string         | null: false              |
| first_name         | string         | null: false              |
| family_name_kana   | string         | null: false              |
| first_name_kana    | string         | null: false              |
| birth_day          | date           | null: false              |

### association

- has_many :products dependent: :destroy
- has_many :orders dependent: :destroy


## productテーブル

| Colum              | Type           | Options                        |
| ------------------ | -------------- | ------------------------------ |
| name               | string         | null: false                    |
| price              | string         | null: false                    |
| description        | string         | null: false                    |
| status_id          | integer        | null: false                    |
| shipping_cost_id   | integer        | null: false                    |
| shipping_days      | integer        | null; false                    |
| prefecture_id      | integer        | null: false                    |
| category_id        | integer        | null: false                    |
| user               | reference      | null: false, foreign_key: true |

### association
- belongs_to :user 
- belongs_to :oder


### ordersテーブル

| Colum         | Type               | Options                          |
| ------------- | ------------------ | -------------------------------- |
| buyer_user    | reference          | null: false, foreign_key: true   |
| product       | reference          | null: false, foreign_key: true   |

### association
- belongs_to :user
- belongs_to :product

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
