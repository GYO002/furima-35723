# README

##usersテーブル
| Column    | Type     | Options     |
| --------  | ------   | ----------- |
| nickname  | string   | NOT NULL    |
| mail      | string   | NOT NULL    |
| password  | string   | NOT NULL    |
| name      | text     | NOT NULL    |
| birthday  | datetime | NOT NULL    |

Association
users has_many items
users has_many comments
users has_one  shipping-address
users has_one  credit-card


##itemsテーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| product-name   | string     | NOT NULL    |
| image          | text       | NOT NULL    |
| description    | string     | NOT NULL    |
| category       | string     | NOT NULL    |
| status         | string     | NOT NULL    |
| burden         | string     | NOT NULL    |
| area           | string     | NOT NULL    |
| delivery-days  | datetime   | NOT NULL    |
| price          | integer    | NOT NULL    |

Association
items belong_to users
items has_one shipping-address

##commentテーブル
| Column   | Type      | Options     |
| -------- | ----------| ----------- |
| text     | text      | NOT NULL    |
| user     | string    | NOT NULL    |
| prototype| string    | NOT NULL    |

Association
comment belong_to users
comment belong_to items

##shipping-addressテーブル
| Column         | Type     | Options     |
| -------------- | ------   | ----------- |
| post-code      | string   | NOT NULL    |
| prefectures    | string   | NOT NULL    |
| municipalities | string   | NOT NULL    |
| address        | text     | NOT NULL    |
| building| text | string   | NOT NULL    |
| phone-number   | integer  | NOT NULL    |

Association
shipping-address belong_one users
shipping-address belong_one items


##credit-cardテーブル
| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| card-information   | string  | NOT NULL    |
| expiration-date    | string  | NOT NULL    |

Association
comment belong_to users

