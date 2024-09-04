# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_kana          | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type    | Options     |
| ------      | ------  | ----------- |
| name        | string  | null: false |
| image       | string  | null: false |
| explanation | string  | null: false |
| category    | string  | null: false |
| condition   | string  | null: false |
| fee         | string  | null: false |
| region      | string  | null: false |
| period      | string  | null: false |
| price       | integer | null: false |
| user        | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |


### Association

- belongs_to :room
- belongs_to :user

## addresses テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| post_code      | string     | null: false |
| prefecture     | string     | null: false |
| municipality   | string     | null: false |
| street_address | string     | null: false |
| building       | string     |             |
| phone_number   | string     | null: false |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order