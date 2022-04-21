class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email

  has_many :orders
end
