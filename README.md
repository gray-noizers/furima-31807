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
| birthday             | date    | null: false               |

### Association

- has_many :items
- has_many :logs
 
 

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| intro         | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| delivery_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| daycount_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :log



## logs テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address




## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| banchi          | string     | null: false                    |
| building        | string     |                                |
| tel             | string     | null: false                    |
| log             | references | null: false, foreign_key: true |

### Association

- belongs_to :log
