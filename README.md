# README

##usersテーブル
| Column             | Type     | Options     |
| --------           | ------   | ----------- |
| nickname           | string   | NOT NULL    |（ニックネーム）
| email              | string   | unique      |（メールアドレス）
| encrypted_password | string   | NOT NULL    |（パスワード）
| last_name          | text     | NOT NULL    |（姓）
| first_name         | text     | NOT NULL    |（名）
| last_name_ruby     | text     | NOT NULL    |（姓、フリガナ）
| first_name_ruby    | text     | NOT NULL    |（名、フリガナ）
| birthday           | date     | NOT NULL    |（生年月日）

Association
users has_many items
users has_many comments
users has_one  purchase_record


##itemsテーブル
| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| product_name    | string     | NOT NULL    |(商品名)
| description     | text       | NOT NULL    |（商品説明）
| category_id     | integer     | NOT NULL    |（カテゴリ）
| status_id       | integer    | NOT NULL    |（商品の状態）
| burden_id       | integer    | NOT NULL    |（配送の負担）
| area_id         | integer    | NOT NULL    |（配送元の地域）
| delivery_day_id | integer    | NOT NULL    |（配送までの日数）
| price           | integer    | NOT NULL    |（価格）
| user            | references | NOT NULL    |（外部キー）

Association
items belong_to use                           (belong_toは単数形)
items has_one shipping-address

##commentテーブル
| Column   | Type      | Options     |
| -------- | ----------| ----------- |
| text     | text      | NOT NULL    |
| user     | reference | NOT NULL    |
| item     | reference | NOT NULL    |

Association
comment belong_to users
comment belong_to items

##shipping-addressテーブル(配送先)
| Column          | Type     | Options     |
| --------------- | ------   | ----------- |
| post_code       | string   | NOT NULL    |（郵便番号）
| prefecture      | integer  | NOT NULL    |（都道府県）
| municipalities  | string   | NOT NULL    |（市町村）
| address         | string   | NOT NULL    |（番地）
| building        | string   | NOT NULL    |（建物名）
| phone_number    | string   | NOT NULL    |（携帯電話）
| purchase_record | reference  NOT NULL    |（商品購入記録の外部キー）

Association
shipping-address belong_one user
shipping-address belong_one item

##purchase_recordテーブル(商品購入記録)
| Column         | Type     | Options     |
| -------------- | ------   | ----------- |
| user           | reference| NOT NULL    |
| item           | reference| NOT NULL    |

Association
purchase-record has_one user
purchase-record has_one item