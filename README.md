# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_one :profile
- has_many :restaurants
- has_many :comments
- has_many :likes
- has_many :like_restaurants, through: :likes, source: :restaurant

## profiles テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| favorite_food | string     | null: false                    |
| hated_food    | string     |                                |
| profile       | text       | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user, optional: true

## restaurants テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| store_name  | string     | null: false                    |
| address     | string     |                                |
| genre_id    | integer    | null: false                    |
| rating_id   | integer    | null: false                    |
| description | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :users, through: :likes

## likesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| restaurant | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :restaurant

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| restaurant | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :restaurant