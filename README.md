# テーブル設計

## users テーブル

| Column   | Type    | options     |
|----------|---------|-------------|
| name     | string  | null: false | 
| email    | string  | null: false |
| password | string  | null: false |
| birthday | integer | null: false |

### Association

- has_many :products
- has_many :items

## products テーブル

| Column             | Type       | options                        |
|--------------------|------------|--------------------------------|
| picture            | string     | null:false                     |
| product_name       | string     | null:false                     |
| product_description| text       | null:false                     |
| product_details    | string     | null:false                     |
| delivery_method    | string     |  null:false                    |
| selling_prise      | integer    | null:false                     |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- has_one :item
- belongs_to :user

## items テーブル

| Column      | Type       | options                        |
|-------------|------------|--------------------------------|
| credit_card | integer    | null: false                    | 
| address     | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| products    | references | null: false, foreign_key: true |

### Association

- belongs_to :product