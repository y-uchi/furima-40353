class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :tel_number

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :tel_number, format: { with: /\A[0-9]{10,11}\z/ }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, tel_number: tel_number, order_id: order.id) 
  end
end
