class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city, :prefecture_id, :street, :building_name, :phone_number, :order_id, :token, :price

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is too short"}
    validates :token
  end
  validates :phone_number, format: {with: /\A[0-9]+\z/, message: "invalid. Input only number"}
    
    

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, city: city, prefecture_id: prefecture_id, street: street, phone_number: phone_number, building_name: building_name, order_id: order.id)
  end
end