class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :price,  numericality: {only_integer: true, greater_than_orequal_to: 300, less_than_or_eual_to: 9_999_999 },presence: { message: "can't be blank"}
  validates  :category_id, presence: true
  validates  :sales_status_id, presence: true
  validates  :shipping_fee_id, presence: true
  validates  :item_prefecture_id, presence: true
  validates  :scheduled_delivery_id, presence: true

  validates_format_of :price, with: /\A[0-9]+\z/, message: 'is invalid.' 
  

  belongs_to :user

  has_one_attached :image

  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :sales_status
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :shipping_fee
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :item_prefecture
  validates :item_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :scheduled_delivery
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

end
