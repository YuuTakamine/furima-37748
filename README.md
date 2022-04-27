# DB設計

## users_table

| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| email              | string              | null: false, unique: true    |
| nick_name          | string              | null: false                  |
| encrypted_password | string              | null: false                  |
| last_name          | string              | null: false                  |
| first_name         | string              | null: false                  |
| last_name_kana     | string              | null: false                  |
| first_name_kana    | string              | null: false                  |
| birthday           | datetime            | null: false                  |

### Association

* has_many :items
* has_many :buys

## items_table

| Column            | Type                | Options                       |
|-------------------|---------------------|-------------------------------|
| item_name         | string              | null: false                   |
| item_explanation  | text                | null: false                   |
| item_detail       | string              | null: false                   |
| delivery          | string              | null: false                   |
| price             | integer             | null: false                   |
| category          | integer             | null: false                   |
| product_condition | integer             | null: false                   |
| delivery_borden   | integer             | null: false                   |
| sipping_area      | integer             | null: false                   |
| days_to_ship      | integer             | null: false                   |
| user              | references          | null: false, foreign_key: true|

### Association

* belongs_to :user
* has_one    :buys

## buys_table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| user               | references          | null: false,foreign_key: true |
| item               | references          | null: false,foreign_key: true |

### Association

* belong_to :user
* belong_to :item
* has_one   :sipping_address

## sipping_address_table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| postal_code        | string              | null: false                   |
| prefecture_id      | string              | null: false                   |
| municipalities     | string              | null: false                   |
| address            | string              | null: false                   |
| building_name      | string              |                               |
| telephone_number   | string              | null: false                   |
| buy                | references          | null: false,foreign_kye: true |

### Association

* belong_to :buy
