class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :price, presence: true
  validates  :category_id, presence: true
  validates  :salels_status_id, presence: true
  validates  :shipping_fee_id, presence: true
  validates  :item_prefecture_id, presence: true
  validates  :sheduled_delivery_id, presence: true
  

  belongs_to :user

  has_one_attached :image

  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :salels_status
  validates :salels_status_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :shipping_fee
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :item_prefecture
  validates :item_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :sheduled_delivery
  validates :sheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

end
