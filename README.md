# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :buys

## item テーブル

| Column      | Type      | Options                       |
| ----------- | --------- | ----------------------------- |
| name        | string    | null: false                   |
| description | text      | null: false                   |
| price       | int       | null: false                   |
| user        | reference | null: false, foreign_key: true|
| category    | reference | null: false, foreign_key: true|
| condition   | reference | null: false, foreign_key: true|
| charge      | reference | null: false, foreign_key: true|
| area        | reference | null: false, foreign_key: true|
| days        | reference | null: false, foreign_key: true|

### Association

- has_one :buy
- belongs_to :user
- has_one :category
- has_one :condition
- has_one :charge
- has_one :area
- has_one :days

## buys テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| user    | reference | null: false, foreign_key: true |
| item    | reference | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item
- has_one :addresses

## addresses テーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| address | string    | null: false                    |
| tel     | int       | null: false                    |
| buy     | reference | null: false, foreign_key: true |

### Association

- belongs_to :buy