# テーブル設計

## users テーブル

| Column                       | Type    |  Options                          |
| ---------------------------- | ------- | --------------------------------- |
| nickname                     | string  | null: false                       |
| email                        | string  | null: false, unique:true          |
| encrypted_password           | string  | null: false                       |
| last_name                    | string  | null: false                       |
| first_name                   | string  | null: false                       |
| last_name(Kana)              | string  | null: false                       |
| first_name(Kana)             | string  | null: false                       |
| birth_year                   | integer | null: false                       |
| birth_month                  | integer | null: false                       |
| birth_day                    | integer | null: false                       |

###Association

- has_many :items
- has_many :purchase_record


## items テーブル

| Column                       | Type        |  Options                          |
| ---------------------------- | ----------- | --------------------------------- |
| name                         | string      | null: false                       |
| explanation                  | text        | null: false                       |
| category                     | string      | null: false                       |
| condition                    | string      | null: false                       |
| shipping_fee_responsibility  | string      | null: false                       |
| shipping_origin_region       | string      | null: false                       |
| shipping_days                | string      | null: false                       |
| price                        | integer     | null: false                       |
| user_id                      | references  | null: false, foreign_key: true    |

### Association

- belongs_to :users
- has_one :purchase_record


## purchase_records テーブル

| Column                  | Type        |  Options                          |
| ----------------------- | -----       | --------------------------------- |
| item_id                 | references  | null: false, foreign_key: true    |
| user_id                 | references  | null: false, foreign_key: true    |
| shipping_destination_id | references  | null: false, foreign_key: true    |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :shipping_destinations

## shipping_destinations テーブル

| Column                  | Type    |  Options                          |
| ----------------------- | ------- | --------------------------------- |
| post_code               | integer | null: false                       |
| prefecture              | string  | null: false                       |
| city                    | string  | null: false                       |
| street_address          | string  | null: false                       |
| building_name           | string  | null: false                       |
| phone_number            | integer | null: false                       |

### Association

-has_many :purchase_records