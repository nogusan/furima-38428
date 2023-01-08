class OrderShipAddress
  include ActiveModel::Model
  attr_accessor :post, :city, :line, :build_name, :tell, :order_id, :delivery_id, :user_id, :item_id, :token

  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :tell, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
  with_options presence: true do
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :line
    validates :tell, format: { with: /\A\d{10}$|^\d{11}\z/, message: 'is too short' }
    validates :user_id
    validates :item_id
    validates :token, format: { with: /\A[tok]/, message: "can't be blank" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShipAddress.create(post: post, city: city, line: line, build_name: build_name, tell: tell, order_id: order.id,
                       delivery_id: delivery_id)
  end
end
