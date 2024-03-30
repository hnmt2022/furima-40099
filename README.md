# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| kana_name          | string | null: false               |
| birthday           | text   | null: false               |



### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_info          | text       | null: false                    |
| price              | integer    | null: false                    |
| category           | integer    | null: false                    |
| sales_status       | integer    | null: false                    |
| shipping_fee       | integer    | null: false                    |
| item-prefecture    | integer    | null: false                    |
| scheduled_delivery | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## order テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item

