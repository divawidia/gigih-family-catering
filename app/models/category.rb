class Category < ApplicationRecord
    has_many :menus_categories
    has_many :menus, through :menus_categories
end
