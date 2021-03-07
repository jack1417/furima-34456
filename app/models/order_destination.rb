class OrderDestination 
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:order_id,:post_code,:prefecture_id,:city,:address,:building_name,:phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :address
    validates :city
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :prefecture_id, numericality: { other_than: 0} 

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create!(order_id: @order.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end

