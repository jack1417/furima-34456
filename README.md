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


## itemsテーブル

| Colum              | Type           | Options                        |
| ------------------ | -------------- | ------------------------------ |
| name               | string         | null: false                    |
| price              | integer        | null: false                    |
| description        | text           | null: false                    |
| status_id          | integer        | null: false                    |
| shipping_cost_id   | integer        | null: false                    |
| shipping_day_id    | integer        | null; false                    |
| prefecture_id      | integer        | null: false                    |
| category_id        | integer        | null: false                    |
| user               | references     | null: false, foreign_key: true |

### association
- belongs_to :user 
- has_one :order


### ordersテーブル

| Colum         | Type               | Options                          |
| ------------- | ------------------ | -------------------------------- |
| user          | references         | null: false, foreign_key: true   |
| item            | references         | null: false, foreign_key: true   |

### association
- belongs_to :user
- belongs_to :product
- has_one :destination



## destinationsテーブル
| Colum             | Type            | Options                        |
| ----------------- | --------------- | ------------------------------ |
| order             | references      | null: false, foreign_key: true |
| post_code         | string          | null: false                    |
| prefecture_id     | integer         | null: false                    |
| city              | string          | null: false                    |
| address           | string          | null: false                    |
| building_name     | string          |                                |
| phone_number      | string          | null: false                    |


- belongs_to :order
