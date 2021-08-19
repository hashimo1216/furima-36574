# users テーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| nickname            | string     | null: false               |
| email               | string     | null: false, unique:true  |
| encrypted_password  | string     | null: false               |
| family_name         | string     | null: false               |
| first_name          | string     | null: false               |
| family_name_kana    | string     | null: false               |
| first_name_kana     | string     | null: false               |
| birth_day           | integer    | null: false               |

### Association

- has_many :items
- has_many :orders
- has_one :address


# items テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| item_name           | string     | null: false              |
| description         | text       | null: false              |
| item_price          | integer    | null: false              |
| delivery_fee        | string     | null: false              |
| region              | string     | null: false              |
| shipping_date       | string     | null: false              |
| user                | reference  | null: false, foreign_key |
| bland               | integer    | null: false, foreign_key |
| category            | integer    | null: false, foreign_key |
| status              | integer    | null: false, foreign_key |

### Association

- belongs_to :user
- belongs_to :orders




# orders

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| address             | reference  | null: false, foreign_key |
| user                | reference  | null: false, foreign_key |
| item                | reference  | null: false, foreign_key |

### Association

- has_many :items
- belongs_to :user
- belongs_to :address


# address

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| postal_code         | integer    | null: false              |
| prefecture          | string     | null: false              |
| street              | string     | null: false              |
| building_name       | string     |                          |
| phone_number        | string     | null: false              |
| user                | reference  | null: false, foreign_key |

- belongs_to :user
- has_one :order