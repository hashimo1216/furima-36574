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
| birth_day           | date       | null: false               |

### Association

- has_many :items
- has_many :orders

# items テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| item_name           | string     | null: false              |
| description         | text       | null: false              |
| item_price          | integer    | null: false              |
| status_id           | integer    | null: false              |
| bland_id            | integer    | null: false              |
| category_id         | integer    | null: false              |
| delivery_fee_id     | integer    | null: false              |
| shipping_area_id    | integer    | null: false              |
| shipping_days       | integer    | null: false              |
| user                | reference  | null: false, foreign_key |


### Association

- belongs_to :user
- has_one :order




# orders テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| user                | reference  | null: false, foreign_key |
| item                | reference  | null: false, foreign_key |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address



# addresses テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| postal_code         | string     | null: false              |
| city                | string     | null: false              |
| prefecture_id       | integer    | null: false              |
| street              | string     | null: false              |
| building_name       | string     |                          |
| phone_number        | string     | null: false              |
| order               | references | null: false, foreign_key |

- belongs_to :order