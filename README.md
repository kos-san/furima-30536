# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| nickname                  | string | null: false |
| email                     | string | null: false |
| encrypted_password        | string | null: false |
| first_name                | string | null: false |
| last_name                 | string | null: false |
| first_name_kana           | string | null: false |
| last_name_kana            | string | null: false |
| birthday                  | date   | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column       | Type      | Options                       |
| ------------ | --------- | ----------------------------- |
| name         | string    | null: false                   |
| description  | text      | null: false                   |
| price        | integer   | null: false                   |
| user         | reference | null: false, foreign_key: true|
| category_id  | integer   | null: false                   |
| condition_id | integer   | null: false                   |
| charge_id    | integer   | null: false                   |
| area_id      | integer   | null: false                   |
| day_id      | integer   | null: false                   |

### Association

- has_one :buy
- belongs_to :user

## buys テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| buy         | reference | null: false, foreign_key: true |
| postal_code | string    | null: false                    |
| area_id     | integer   | null: false                    |
| city        | string    | null: false                    |
| house_code  | string    | null: false                    |
| tel         | string    | null: false                    |
| building    | string    |                                |


### Association

- belongs_to :buy