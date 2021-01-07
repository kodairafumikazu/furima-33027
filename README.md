# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------        | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| first_name      | string | null: false               |
| last_name       | string | null: false               |
| first_name_kana | string | null: false               |
| last_name_kana  | string | null: false               |
| birth_date      | date   | null: false               |

### Association

- has_many   :items
- has_many   :management

 

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | -------------------------------|
| info                   | text       | null: false                    |
| category_id            | string     | null: false                    |
| product_condition_id   | string     | null: false                    |
| shipping_charge_id     | string     | null: false                    |
| shipping_area_id       | string     | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user_id                | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_one  :managements

## managements テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |

### Association

- belongs to :user
- belongs to :item
- has_one    :addresses





## addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| postal_code       | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     | null: false                    |
| phone_number      | integer    | null: false                    |
| management_id     | references | null: false, foreign_key: true |

### Association

- belongs to :management