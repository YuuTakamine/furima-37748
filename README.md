# DB設計

## users_table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| nick_name          | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| real_name          | string              | null: false               |
| name               | string              | null: false               |
| birthday           | integer             | null: false               |

### Association

* has_many :items
* has_many :buys
* has_one  :shipping_address

## items_table

| Column            | Type                | Options                       |
|-------------------|---------------------|-------------------------------|
| item_image        | binary              | null: false                   |
| item_name         | string              | null: false                   |
| item_explanation  | string              | null: false                   |
| item_detail       | string              | null: false                   |
| delivery          | string              | null: false                   |
| price             | integer             | null: false                   |
| user              | references          | null: false, foreign_key: true|

### Association

* belongs_to :users
* has_many   :buys
* has_many   :sipping_address

## buys_table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| card               | integer             | null: false                   |
| deadline           | integer             | null: false                   |
| security           | integer             | null: false                   |
| user               | references          | null: false,foreign_key: true |
| item               | references          | null: false,foreign_key: true |

### Association

* belong_to :users
* belong_to :items
* has_one   :sipping_address

## sipping_address_table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| postal_code        | integer             | null: false                   |
| prefecture         | string              | null: false                   |
| municipalities     | string              | null: false                   |
| address            | integer             | null: false                   |
| building_name      | string              | null: false                   |
| telephone_number   | integer             | null: false                   |
| user               | references          | null: false,foreign_kye: true |
| item               | references          | null: false,foreign_kye: true |
| buy                | references          | null: false,foreign_kye: true |

### Association

* belong_to :users
* belong_to :items
* belong_to :buys
