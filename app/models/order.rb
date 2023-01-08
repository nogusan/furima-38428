class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :ship_addresses
end
