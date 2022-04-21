class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :category_name

  has_many :menus_categories
  has_many :menus, through: :menus_categories
end
