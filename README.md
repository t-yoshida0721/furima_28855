
  - # aaa


# テーブル設計

## users テーブル

| Column          | Type    | options     |
|-----------------|---------|-------------|
| nickname        | string  | null: false | 
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :bids

## items テーブル

| Column             | Type       | options                        |
|--------------------|------------|--------------------------------|
| picture            | string     | null:false                     |
| product_name       | string     | null:false                     |
| product_description| text       | null:false                     |
| product category   | integer    | null:false                     |
| Product status     | integer    | null:false                     |
| burden             | integer    | null:false                     |
| area               | integer    | null:false                     |
| days               | integer    | null:false                     |
| selling_prise      | integer    | null:false                     |
| user               | references | null: false, foreign_key: true |


### Association

- has_one :item
- belongs_to :user
- has_one :bid

## orders テーブル

| Column        | Type       | options                        |
|---------------|------------|--------------------------------|
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :bid

## bid テーブル
　
| Column        | Type       | options                        |
|---------------|------------|--------------------------------|
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order
