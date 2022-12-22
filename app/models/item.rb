class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :categoly
  belongs_to :status
  belongs_to :payer
  belongs_to :delivery
  belongs_to :place

  validates :item_name, presence: true
  validates :content, presence: true
  validates :price, presence: true, numericality: { greater_than: 299, less_than: 10000000, message: 'is out of setting range' } 
  validates :categoly_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :payer_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :place_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :image, presence: true
end
