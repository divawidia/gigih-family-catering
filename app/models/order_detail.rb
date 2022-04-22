class OrderDetail < ApplicationRecord
  validates :order_id, presence: true
  validates :menu_id, presence: true
  validates :subtotal, presence: true
  validates :qty, presence: true

  belongs_to :order
  belongs_to :menu
end
