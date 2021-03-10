class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :prefecture
  belongs_to       :shipping_cost
  belongs_to       :shipping_day
  belongs_to       :status
  belongs_to       :user
  has_one :order
  

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipping_cost_id
    validates :shipping_day_id
    validates :status_id
  
  end

  validates :prefecture_id, numericality: { other_than: 0} 
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid" }, presence: true 
  
end
