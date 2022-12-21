class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :categoly

  validates :categoly_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
