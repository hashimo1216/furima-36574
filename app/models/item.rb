class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_days
  belongs_to :user
  has_one :order
  has_one_attached :image

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: "is invalid. Input half-width characters"
  
  with_options presence: true do
    validates :name
    validates :description   
    validates :price,            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
    validates :category_id,      numericality: { other_than: 1, message: "can't be blank"}
    validates :status_id,        numericality: { other_than: 1, message: "can't be blank"}
    validates :delivery_fee_id,  numericality: { other_than: 1, message: "can't be blank"}
    validates :prefecture_id,    numericality: { other_than: 1, message: "can't be blank"}
    validates :shipping_days_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :image
  end 
end
