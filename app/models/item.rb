class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to :categoly
  belongs_to :status
  belongs_to :payer

  validates :categoly_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :payer_id, numericality: { other_than: 1 , message: "can't be blank"}
end
