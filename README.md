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

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name        | string | null: false |
| description | text   | null: false |
| price       | int    | null: false |

### Association

- has_one :buy
- belongs_to :user

## buys テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| address | string | null: false |

### Association

- belongs_to :users
- belongs_to :item