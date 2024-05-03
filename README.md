# テーブル設計

## usersテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| kana_family_name | string  | null: false |
| kana_first_name  | string  | null: false |
| email            | string  | null: false, unique: true |
| password         | string  | null: false |
| birth_y          | integer | null: false |
| birth_m          | integer | null: false |
| birth_d          | integer | null: false |

### Association
- has_many :items 
- has_many :comments
- has_many :orders


## itemsテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_name          | string     | null: false |
| detail             | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| shipping_source_id | integer    | null: false |
| shipping_days_id   | integer    | null: false |
| price              | integer    | null: false |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :order

# commentsテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| content | text       | null: false |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

# ordersテーブル

| Column         | Type       | Options |
| -------------- | ---------- | ------- |
| item_id        | references | null: false, foreign_key: true |
| user_id        | references | null: false, foreign_key: true |
| post_code      | integer    | null: false |
| prefectures_id | integer    | null: false |
| municipalities | string     | null: false |
| street_address | integer    | null: false |
| building_name  | string     |  |
| tel_number     | integer    | null: false |

### Association
- belongs_to :user
- has_one :item
