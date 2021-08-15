class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city_name, :street, :building_name, :phone_number, :item_id, :user_id, :token

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_name
    validates :street
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "Phone number is invalid. Input only number"}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, city_name: city_name, street: street, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

  
end