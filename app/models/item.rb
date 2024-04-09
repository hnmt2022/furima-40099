class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :price, numericality: { only_integer: true, in: 300..9_999_999 }, presence: { message: "can't be blank" }
  validates  :category_id, presence: true
  validates  :sales_status_id, presence: true
  validates  :shipping_fee_id, presence: true
  validates  :item_prefecture_id, presence: true
  validates  :scheduled_delivery_id, presence: true

  validates_format_of :price, with: /\A[0-9]+\z/, message: 'is invalid.'

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :sales_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user

  has_one_attached :image
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :item_prefecture
  belongs_to :scheduled_delivery
end
