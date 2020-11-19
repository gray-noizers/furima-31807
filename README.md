# テーブル設計

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| family_name          | string  | null: false               |
| first_name           | string  | null: false               |
| family_name_furigama | string  | null: false               |
| first_name_furigama  | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               | 
| birthday             | integer | null: false               |

### Association

- has_many :items


## items テーブル

| Column       | Type    | Options     |
| ---------    | ------- | ----------- |
| title        | string  | null: false |
| intro        | text    | null: false |
| category_id  | integer | null: false |
| condition_id | integer | null: false |
| delivery_id  | integer | null: false |
| area_id      | integer | null: false |
| date_id      | integer | null: false |
| price        | integer | null: false |

### Association

- belongs_to :user
- belongs_to :log

## logs テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :address



## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| municipality    | string     | null: false                    |
| banchi          | string     | null: false                    |
| building        | string     |                                |
| tel             | string     | null: false                    |
| log_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :log
