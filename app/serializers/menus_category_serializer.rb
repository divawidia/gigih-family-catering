class MenusCategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :menu_id, :category_id
end
