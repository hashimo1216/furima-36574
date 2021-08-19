# users テーブル

| Column              | Type       | Options                 |
| ------------------- | ---------- | ----------------------- |
| nickname            | string     | null: false             |
| email               | string     | null: false             |
| encrypted_password  | string     | null: false             |
| family_name         | string     | null: false             |
| first_name          | string     | null: false             |
| family_name_kana    | string     | null: false             |
| first_name_kana     | string     | null: false             |

### Association

- has_many :items
- has_many :orders
- has_many :comments
- has_many :likes
- has_one :credit_card
- has_one :address

# credit_card

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| number              | integer    | null: false              |
| date_expiry         | integer    | null: false              |
| security_code       | integer    | null: false              |
| user                | reference  | null: false, foreign_key |

### Association
- belongs_to :user

# items テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| item_name           | string     | null: false              |
| description         | text       | null: false              |
| item_price          | string     | null: false              |
| delivery_fee        | string     | null: false              |
| region              | string     | null: false              |
| shipping_date       | string     | null: false              |
| user                | reference  | null: false, foreign_key |
| bland               | reference  | null: false, foreign_key |
| category            | reference  | null: false, foreign_key |
| status              | reference  | null: false, foreign_key |

### Association

- belongs_to :user
- belongs_to :bland
- belongs_to :category
- belongs_to :status
- has_many :comments
- has_many :likes
- belongs_to :orders


# bland テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| name                | string     | null: false              |

### Association

- has_many :items


# category テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| name                | string     | null: false              |

### Association

- has_many :items


# status テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | ------------------------ |
| status              | string     | null: false              |

### Association

has_many :items


# comments テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| comment             | text       | null: false              |
| user                | reference  | null: false, foreign_key |
| item                | reference  | null: false, foreign_key |

### Association
- belongs_to :user_id
- belongs_to :item_id


# likes テーブル

| Column              | Type       | Options                  |
| ------------------- | ---------- | -------------------------|
| comment             | text       | null: false              |
| user                | reference  | null: false, foreign_key |
| item                | reference  | null: false, foreign_key |

### Association

- belongs_to :user_id
- belongs_to :item_id

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
| building_name       | string     | null: false              |
| phone_number        | integer    | null: false              |
| user                | reference  | null: false, foreign_key |

- belongs_to :user
- has_one :order