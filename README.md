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

# items テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| item_name           | string     | null: false              |
| description         | text       | null: false              |
| item_price          | integer    | null: false              |
| user                | reference  | null: false, foreign_key |


### Association

- belongs_to :user
- has_to :orders




# orders

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| user                | reference  | null: false, foreign_key |
| item                | reference  | null: false, foreign_key |

### Association

- belongs_to :items
- belongs_to :user
- has_one :address



# address

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| prefecture_id       | integer    | null: false              |
| street              | string     | null: false              |
| building_name       | string     |                          |
| phone_number        | string     | null: false              |

- belongs_to :order