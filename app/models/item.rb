class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :codition, :delivery_charge, :prefecture, :shipping_day
  with_options presence: true do
    validates :item_name
    validates :database
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :condition_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :price
    validates :user
  end

  belongs_to :user
end
