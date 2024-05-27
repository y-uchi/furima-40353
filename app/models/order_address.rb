class OderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_coke, :prefecture_id, :municipalities, :street_address, :building_name, :tel_number, :order_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :municipalities
    validates :street_address
    validates :tel_number
    validates :order_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id) # rubocop:disable Lint/UselessAssignment
    address = Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, tel_number: tel_number, order_id: order_id) # rubocop:disable Lint/UselessAssignment
  end
end
