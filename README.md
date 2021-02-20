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

- has_many :products 
- has_many :orders


## productsテーブル

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
| user               | references     | null: false, foreign_key: true |

### association
- belongs_to :user 
- belongs_to :oder


### ordersテーブル

| Colum         | Type               | Options                          |
| ------------- | ------------------ | -------------------------------- |
| user          | references         | null: false, foreign_key: true   |
| product       | references         | null: false, foreign_key: true   |

### association
- belongs_to :user
- belongs_to :product
- has_one :destination



## destinationsテーブル
| Colum             | Type            | Options                        |
| ----------------- | --------------- | ------------------------------ |
| user_id           | integer         | null: false, foreign_key: true |
| post_code         | string          | null: false                    |
| prefecture_id     | string          | null: false                    |
| city              | string          | null: false                    |
| address           | string          | null: false                    |
| building_name     | string          |                                |
| phone_number      | string          | null: false                    |


- belongs_to :order
