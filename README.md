# テーブル設計

## users テーブル

| Column                       | Type    |  Options                          |
| ---------------------------- | ------- | --------------------------------- |
| nickname                     | string  | null: false                       |
| email                        | string  | null: false, unique:true          |
| encrypted_password           | string  | null: false                       |
| last_name                    | string  | null: false                       |
| first_name                   | string  | null: false                       |
| last_name_Kana               | string  | null: false                       |
| first_name_Kana              | string  | null: false                       |
| birthday                     | date    | null: false                       |

###Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column                          | Type        |  Options                          |
| ------------------------------- | ----------- | --------------------------------- |
| name                            | string      | null: false                       |
| explanation                     | text        | null: false                       |
| category_id                     | integer     | null: false                       |
| condition_id                    | integer     | null: false                       |
| shipping_fee_responsibility_id  | integer     | null: false                       |
| prefecture_id                   | integer     | null: false                       |
| shipping_days_id                | integer     | null: false                       |
| price                           | integer     | null: false                       |
| user                            | references  | null: false, foreign_key: true    |

### Association

- belongs_to :user
- has_one :purchase_record
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee_responsibility
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_days


## purchase_records テーブル

| Column                  | Type        |  Options                          |
| ----------------------- | ----------- | --------------------------------- |
| item                    | references  | null: false, foreign_key: true    |
| user                    | references  | null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_destination

## shipping_destinations テーブル

| Column                  | Type        |  Options                          |
| ----------------------- | ----------- | --------------------------------- |
| post_code               | string      | null: false                       |
| prefecture_id           | integer     | null: false                       |
| city                    | string      | null: false                       |
| street_address          | string      | null: false                       |
| building_name           | string      |                                   |
| phone_number            | string      | null: false                       |
| purchase_record         | references  | null: false, foreign_key: true    |

### Association

- belongs_to :purchase_record
- belongs_to_active_hash :prefecture