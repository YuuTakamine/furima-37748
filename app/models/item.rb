class Item < ApplicationRecord
  belongs_to :user

  validates :item_name, presence: true 
  validates :item_explanation, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :product_condition_id, presence: true
  validates :delivery_borden_id, presence: true
  validates :sipping_area_id, presence: true
  validates :days_to_ship_id, presence: true
end
