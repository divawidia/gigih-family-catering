class Category < ApplicationRecord
    validates :category_name, presence: true, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }, uniqueness: true

    has_many :menus_categories
    has_many :menus, through: :menus_categories
end
