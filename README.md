# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| kana_family_name   | string  | null: false |
| kana_first_name    | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| birthday          | integer | null: false |

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
| shipping_day_id   | integer    | null: false |
| price              | integer    | null: false |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_one :order

# commentsテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| content | text       | null: false |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

# ordersテーブル

| Column         | Type       | Options |
| -------------- | ---------- | ------- |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |
| address     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item
- belongs_to :address

# addressテーブル

| Column         | Type       | Options |
| -------------- | ---------- | ------- |
| post_code      | integer    | null: false |
| prefectures_id | integer    | null: false |
| municipalities | string     | null: false |
| street_address | integer    | null: false |
| building_name  | string     |  |
| tel_number     | integer    | null: false |
| order          | references | null: false, foreign_key: true |

### Association
- has_many :orders