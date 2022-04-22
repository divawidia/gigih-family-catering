FactoryBot.define do
    factory :menu do
        name { "Nasi Uduk" }
        description { "Betawi style steamed rice cooked in coconut milk. Delicious!" }
        price { 10000.0 }
    end

    factory :invalid_food, parent: :food do
        name { nil }
        description { nil }
        price { 0.001 }
    end
end