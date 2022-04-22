FactoryBot.define do
    factory :order_detail do
        order_id { 1 }
        menu_id { 1 }
        qty { 2 }
        subtotal { 30000.0 }
    end
  end