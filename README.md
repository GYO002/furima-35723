# README

##usersテーブル
| Column             | Type     | Options     |
| --------           | ------   | ----------- |
| nickname           | string   | NOT NULL    |（ニックネーム）
| email              | string   | NOT NULL    |（メールアドレス）
| encrypted_password | string   | NOT NULL    |（パスワード）
| name               | text     | NOT NULL    |（名前）
| birthday           | date     | NOT NULL    |（生年月日）

Association
users has_many items
users has_many comments
users has_one  shipping-address
users has_one  credit-card


##itemsテーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| product-name   | string     | NOT NULL    |(商品名)
| description    | text       | NOT NULL    |（商品説明）
| category       | string     | NOT NULL    |（カテゴリ）
| status         | integer    | NOT NULL    |（商品の状態）
| burden         | integer    | NOT NULL    |（配送の負担）
| area           | integer    | NOT NULL    |（配送元の地域）
| delivery-days  | integer    | NOT NULL    |（配送までの日数）
| price          | integer    | NOT NULL    |（価格）
| user           | references | NOT NULL    |（外部キー）

Association
items belong_to users
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

##shipping-addressテーブル
| Column         | Type     | Options     |
| -------------- | ------   | ----------- |
| post-code      | string   | NOT NULL    |（郵便番号）
| prefectures    | integer  | NOT NULL    |（都道府県）
| municipalities | string   | NOT NULL    |（市町村）
| address        | text     | NOT NULL    |（番地）
| building       | text     | NOT NULL    |（建物名）
| phone-number   | string   | NOT NULL    |（携帯電話）

Association
shipping-address belong_one users
shipping-address belong_one items

##purchase-recordテーブル(商品購入記録)
| Column         | Type     | Options     |
| -------------- | ------   | ----------- |
| user           | reference| NOT NULL    |
| item           | reference| NOT NULL    |

Association
purchase-record has_one user
purchase-record has_one item