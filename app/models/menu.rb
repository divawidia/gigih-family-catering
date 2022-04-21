class Menu < ApplicationRecord
    has_and_belongs_to_many :categories

    has_many :order_details
    has_many :orders, through :order_details
end
