class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :category_name
  
  has_and_belongs_to_many :menus
end
