require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name, a description, and price' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'is invalid without a name' do
    menu = FactoryBot.build(:menu, name: nil)
    menu.valid?

    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    menu = FactoryBot.build(:menu, description: nil)
    menu.valid?

    expect(menu.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    menu = FactoryBot.build(:menu, price: nil)
    menu.valid?

    expect(menu.errors[:price]).to include("can't be blank")
  end

  it 'check food price is numeric only' do
    menu = FactoryBot.build(:menu, price: "2000s")
    menu.valid?

    expect(menu.errors[:price]).to include("is not a number")
  end

  it 'check food price is is greater than equals to 0.01' do
    menu = FactoryBot.build(:menu, price: 0.001)
    menu.valid?

    expect(menu.errors[:price]).to include("must be greater than 0.01")
  end

  it 'check food description below 150 word' do
    menu = FactoryBot.build(:menu, description: 'Nasi Uduk (Rice Cooked in Coconut Milk) is originally from Jakarta and very popular in Jakarta and other cities in Indonesia. It is served for breakfast, lunch, or dinner. It is common in Indonesia to eat rice for breakfast')
    menu.valid?

    expect(menu.errors[:description]).to include("150 characters is the maximum allowed")
  end

  it "is invalid with a duplicate name" do
    menu1 = FactoryBot.create(:menu, name: 'Nasi Uduk')
    menu2 = FactoryBot.build(:menu, name: 'Nasi Uduk')

    menu2.valid?

    expect(menu2.errors[:name]).to include("has already been taken")
  end
end