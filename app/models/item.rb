class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :detail, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :image
  end
end
