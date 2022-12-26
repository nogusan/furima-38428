class ShipAddress < ApplicationRecord

  belongs_to :order
  belongs_to :place
end
