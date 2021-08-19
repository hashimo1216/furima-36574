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

- has_many :item
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
| user                | reference  | null: false, foreign_key |


### Association

- belongs_to :user
- has_to :orders




# orders テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| user                | reference  | null: false, foreign_key |
| item                | reference  | null: false, foreign_key |

### Association

- belongs_to :items
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
| order               | references | null: false              |

- belongs_to :order