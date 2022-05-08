class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :delivery_borden
  belongs_to :sipping_area
  belongs_to :days_to_ship
  has_one_attached :image
  belongs_to :user

  validates :image, presence: { message: "can't be blank" }
  validates :item_name, presence: { message: "can't be blank" }
  validates :item_explanation, presence: true
  validates :price, presence: { message: "can't be blank"}
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters" }
  validates :price, numericality: {greater_than: 300,less_than: 9999999, message: "is out of setting range" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_borden_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :sipping_area_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank"}
end
