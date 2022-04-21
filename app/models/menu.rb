class Menu < ApplicationRecord
    has_many :menus_categories
    has_many :categories, through :menus_categories

    has_many :order_details
    has_many :orders, through :order_details
end
