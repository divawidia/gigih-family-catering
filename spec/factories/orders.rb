FactoryBot.define do
    factory :order do
        customer_id { 7 }
        total { 30000.0 }
        status { "NEW" }
        order_date {"2022-04-22"}
    end
end