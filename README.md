# テーブル設計

## users　テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| name     | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false, unique: true | 

## items テーブル

| Column    | Type   | Options     |
| ------    | ------ | ----------- |
| title     | string | null: false |
| image     | string | null: false |
| intro     | text   | null: false |
| category  | string | null: false |
| condition | string | null: false |
| delivery  | string | null: false |
| area      | string | null: false |
| date      | string | null: false |
| price     | string | null: false |

## logs テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

## addresses テーブル

| Column       | Type   | Options     |
| -------      | ------ | ----------- |
| postal_code  | string | null: false |
| prefectures  | string | null: false |
| municipality | string | null: false |
| banchi       | string | null: false |
| building     | string |             |
| tel          | string | null: false | 
