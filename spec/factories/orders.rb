FactoryBot.define do
    factory :order do
        customer_id { 1 }
        total { 30000.0 }
        status { "NEW" }
        order_date {"2022-04-22"}
    end

    factory :invalid_order, parent: :order do
        customer_id { nil }
        total { nil }
        status { "delete" }
        order_date { nil } 
    end
end