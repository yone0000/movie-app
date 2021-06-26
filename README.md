# README

This README would normally document whatever steps are necessary to get the
application up and running.
## users テーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| name            | string | null: false |
| email               | string | null: false unique: true|
| encrypted_password  | string | null: false |
| gender_id           | string | null: false |
| height         | string | null: false |
| weight     | string | null: false |



### Association
- has_many :items
- has_many :
  

## items テーブル

| Column                        | Type   | Options     |
| ------                        | ------ | ----------- |
| name                     | string | null: false |
| info                     | text | null: false |
| category_id              | integer  | null: false |
| sales_status_id          | integer | null: false  |
| shipping_fee_status_id   | integer | null: false |
| prefecture_id            | integer| null: false |
| schedule_delivery_id     | integer| null: false  |
| price                    | integer| null: false  |
| user                      | references | null: false foreign_key: true |

### Association
- has_one :buy
- belongs_to :user


## buys テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- belongs_to:item
- belongs_to:user
- has_one :address


## addresses テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| postal_code  | string | null: false|
| prefecture_id|  integer  | null: false |
| city         | string | null: false|
| house_number  | string | null: false|
| building     | integer |
| phone_number | string | null: false|
| sell_item        | references | foreign_key: true |
| user         | references | foreign_key: true |


### Association
- belongs_to :buy 
