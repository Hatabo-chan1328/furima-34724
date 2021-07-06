# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday_year    | integer | null: false |
| birthday_month   | integer | null: false |
| birthday_days    | integer | null: false |

### Association
- has_many :items
- has_one :buyer
- has_one :address






## items テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| name             | text      | null: false                    |
| description      | string    | null: false                    | 
| category         | string    | null: false                    |
| condition        | string    | null: false                    |
| size             | string    | null: false                    |
| delivery_date    | string    | null: false                    |
| delivery_fee     | string    | null: false                    |
| prefecture       | string    | null: false                    |
| delivery_days    | string    | null: false                    |
| price            | string    | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

### Association
- belongs_to :user







## buyer テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| last-name        | string    | null: false                    |
| first-name       | string    | null: false                    |
| last-name-kana   | string    | null: false                    |
| first-name-kana  | string    | null: false                    |
| phone-number     | string    | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

### Association
- belongs_to :user






## address テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| post-code        | string    | null: false                    |
| prefecture       | string    | null: false                    |
| city_name        | string    | null: false                    |
| street           | string    | null: false                    |
| building-name    | string    | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
