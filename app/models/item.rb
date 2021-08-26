class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :shipping_days
  belongs_to :user
  has_one :order
  has_one_attached :image

  ITEM_PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :item_price, with: ITEM_PRICE_REGEX, message: 'is invalid. Input half-width characters'

  with_options presence: true do
    validates :item_name
    validates :description
    validates :item_price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
    validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
    validates :status_id,        numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_fee_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_days_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :image
  end
end
