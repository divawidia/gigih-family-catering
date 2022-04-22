class Menu < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true, comparison: { greater_than: 0.01 }, numericality: true
    validates :description, presence: true, length: { maximum: 150 }
    
    has_many :menus_categories
    has_many :categories, through: :menus_categories

    has_many :order_details
    has_many :orders, through: :order_details
end
