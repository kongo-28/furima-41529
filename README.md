# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name                | string | null: false |
| family_name               | string | null: false |
| first_name_kana           | string | null: false |
| family_name_kana          | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| image          | text    | null: false |
| explanation    | text    | null: false |
| category_id    | integer | null: false |
| condition_id   | integer | null: false |
| fee_id         | integer | null: false |
| prefecture_id  | integer | null: false |
| period_id      | integer | null: false |
| price          | integer | null: false |
| user           | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| post_code      | string     | null: false |
| prefecture_id  | integer    | null: false |
| municipality   | string     | null: false |
| street_address | string     | null: false |
| building       | string     |             |
| phone_number   | string     | null: false |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order