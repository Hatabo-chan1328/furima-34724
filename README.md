# テーブル設計

## users テーブル

| Column                     | Type    | Options                   |
| -------------------------- | ------- | ------------------------- |
| nickname                   | string  | null: false               |
| email                      | string  | null: false, unique :true |
| encrypted_password         | string  | null: false               |
| last_name                  | string  | null: false               |
| first_name                 | string  | null: false               |
| last_name_kana             | string  | null: false               |
| first_name_kana            | string  | null: false               |
| birth_day                  | date    | null: false               |

### Association
- has_many :items
- has_many :purchases



## purchases テーブル

| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address




## items テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| name             | text      | null: false                    |
| description      | text      | null: false                    | 
| category_id      | string    | null: false                    |
| condition_id     | string    | null: false                    |
| delivery_fee_id  | integer   | null: false                    |
| prefecture_id    | string    | null: false                    |
| delivery_day_id  | integer   | null: false                    |
| price            | string    | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase



## address テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| post-code        | string    | null: false                    |
| prefecture       | string    | null: false                    |
| city_name        | string    | null: false                    |
| street           | string    | null: false                    |
| building-name    | string    |                                |
| phone-number     | string    | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

### Association
- belongs_to :purchase
