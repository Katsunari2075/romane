# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   |             |

### Association

- has_many :restaurants
- has_many :comments

## restaurants テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| address     | string     |                                |
| genre_id    | integer    | null: false                    |
| rating_id   | integer    | null: false                    |
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| restaurant | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :restaurant