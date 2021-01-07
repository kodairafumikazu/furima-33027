# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| family name     | string | null: false |
| first name      | string | null: false |
| family frigana  | string | null: false |
| first frigana   | string | null: false |
| birthday        | string | null: false |

### Association

- has_many   :items
- belongs to :address                                                           
<!-- - belongs to :management -->

 

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | -------------------------------|
| description            | text       | null: false                    |
| category               | integer    | null: false                    |
| condition              | integer    | null: false                    |
| charge                 | integer    | null: false                    |
| delivery               | integer    | null: false                    |
| prefecture             | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- has_many :addresses
- belongs to :user

## addresses テーブル

| Column             | Type       | Options                        |
| -------------------| ---------- | ------------------------------ |
| name               | string     | null: false                    |
| address            | string     | null: false                    |
| area               | integer    | null: false                    |
| date               | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs to :user
- belongs to :item           
<!-- - has_one    :managements -->




## managements テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association


- has_one :addresses                                                              
- belongs to :user
- belongs to :item 