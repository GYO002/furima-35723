# README

##usersテーブル
| Column             | Type     | Options                  |
| --------           | ------   | -----------              |
| nickname           | string   | null: false              |（ニックネーム）
| email              | string   | unique: true null: false |（メールアドレス）
| encrypted_password | string   | null: false              |（パスワード）
| last_name          | string   | null: false              |（姓）
| first_name         | string   | null: false              |（名）
| last_name_ruby     | string   | null: false              |（姓、フリガナ）
| first_name_ruby    | string   | null: false              |（名、フリガナ）
| birthday           | date     | null: false              |（生年月日）

Association
users has_many items
users has_many comments
users has_many  purchase_records


##itemsテーブル (商品)
| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| product_name    | string     | null: false |(商品名)
| description     | text       | null: false |（商品説明）
| category_id     | integer    | null: false |（カテゴリ）
| status_id       | integer    | null: false |（商品の状態）
| burden_id       | integer    | null: false |（配送の負担）
| area_id         | integer    | null: false |（配送元の地域）
| delivery_day_id | integer    | null: false |（配送までの日数）
| price           | integer    | null: false |（価格）
| user            | references | foreign_key |（外部キー）

Association
items belongs_to user                           (belongs_toは単数形)
items has_one purchase_record

##commentテーブル
| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| text     | text       | null: false |
| user     | references | foreign_key |（外部キー制約）
| item     | references | foreign_key |（外部キー制約）

Association
comment belongs_to user
comment belongs_to item

##addressテーブル(配送先or住所テーブル)
| Column          | Type       | Options     |
| --------------- | ------     | ----------- |
| post_code       | string     | null: false |（郵便番号）
| area_id         | integer    | null: false |（都道府県）
| municipalities  | string     | null: false |（市町村）
| address         | string     | null: false |（番地）
| building        | string     |             |（建物名）※任意のためNOT NULL
| phone_number    | string     | null: false |（携帯電話）
| purchase_record | references ｜ foreign_key |（商品購入記録の外部キー）

Association
shipping-address belongs_to purchase_record


##purchaseテーブル(商品購入記録)
| Column         | Type      | Options     |
| -------------- | ----------| ----------- |
| user           | references| foreign_key |
| item           | references| foreign_key |

Association
purchase_record belongs_to user
purchase_record belongs_to item
purchase_record has_one shipping_address