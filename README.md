# README

##usersテーブル
| Column             | Type     | Options         |
| --------           | ------   | -----------     |
| nickname           | string   | NOT NULL        |（ニックネーム）
| email              | string   | unique NOT NULL |（メールアドレス）
| encrypted_password | string   | NOT NULL        |（パスワード）
| last_name          | string   | NOT NULL        |（姓）
| first_name         | string   | NOT NULL        |（名）
| last_name_ruby     | string   | NOT NULL        |（姓、フリガナ）
| first_name_ruby    | string   | NOT NULL        |（名、フリガナ）
| birthday           | date     | NOT NULL        |（生年月日）

Association
users has_many items
users has_many comments
users has_many  purchase_records


##itemsテーブル
| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| product_name    | string     | NOT NULL    |(商品名)
| description     | text       | NOT NULL    |（商品説明）
| category_id     | integer    | NOT NULL    |（カテゴリ）
| status_id       | integer    | NOT NULL    |（商品の状態）
| burden_id       | integer    | NOT NULL    |（配送の負担）
| area_id         | integer    | NOT NULL    |（配送元の地域）
| delivery_day_id | integer    | NOT NULL    |（配送までの日数）
| price           | integer    | NOT NULL    |（価格）
| user            | references | foreign_key |（外部キー）

Association
items belongs_to user                           (belongs_toは単数形)
items has_one shipping-address

##commentテーブル
| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| text     | text       | NOT NULL    |
| user     | references | foreign_key |（外部キー制約）
| item     | references | foreign_key |（外部キー制約）

Association
comment belongs_to user
comment belongs_to item

##shipping-addressテーブル(配送先or住所テーブル)
| Column          | Type       | Options     |
| --------------- | ------     | ----------- |
| post_code       | string     | NOT NULL    |（郵便番号）
| area_id         | integer    | NOT NULL    |（都道府県）
| municipalities  | string     | NOT NULL    |（市町村）
| address         | string     | NOT NULL    |（番地）
| building        | string     |             |（建物名）※任意のためNOT NULL
| phone_number    | string     | NOT NULL    |（携帯電話）
| purchase_record | references ｜ foreign_key |（商品購入記録の外部キー）

Association
shipping-address belongs_one purchase-record


##purchase_recordテーブル(商品購入記録)
| Column         | Type      | Options     |
| -------------- | ----------| ----------- |
| user           | references| foreign_key |
| item           | references| foreign_key |

Association
purchase-record belongs_one user
purchase-record belongs_one item
purchase-record has_one shipping-address