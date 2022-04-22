FactoryBot.define do
    factory :customer do
        email { "user@gmail.com" }
    end

    factory :invalid_customer, parent: :customer do
        email { nil }
    end
end