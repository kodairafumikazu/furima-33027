# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :layout_users
- has_many :orders
 <!-- through: layout_users -->

## layouts テーブル

| Column                     | Type   | Options     |
| ---------------------------| ------ | ----------- |
| seller                     | string | null: false |
| category                   | string | null: false |
| condition                  | string | null: false |
| shopping change            | string | null: false |
| delivery area              | string | null: false |
| shopping date              | string | null: false |

### Association

- has_many :layout_users
- has_many :users           
- has_many :orders
<!-- <% through: layout_users %> -->

<!-- ## layout_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| layout | references | null: false, foreign_key: true | -->

<!-- ### Association

- belongs_to :layout
- belongs_to :user -->

## orders テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| credit card      | references | null: false, foreign_key: true |
| delivery address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :layout