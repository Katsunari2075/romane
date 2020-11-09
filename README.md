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
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user

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

## likes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| restaurant | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :restaurant

## relationships テーブル

| Column    | Type    | Options                       |
| --------- | ------- | ----------------------------- |
| user_id   | integer | foreign_key:true              |
| follow_id | integer | foreign_key:{to_table: users} |

### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| restaurant | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :restaurant