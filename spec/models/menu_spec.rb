require 'rails_helper'

RSpec.describe Menu, type: :model do
  it 'is valid with a name, a description, and price' do
    menu = Menu.new(
      name: 'Bubur Ayam',
      description: 'Bubur ayam is a Chinese Indonesian chicken congee. It is rice congee with shredded chicken meat served with some condiments',
      price: 10000.0
    )

    expect(menu).to be_valid
  end

  it 'is invalid without a name' do
    menu = Menu.new(
      name: nil,
      description: 'Bubur ayam is a Chinese Indonesian chicken congee. It is rice congee with shredded chicken meat served with some condiments',
      price: 10000.0
    )

    menu.valid?

    expect(menu.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    menu = Menu.new(
      name: 'Bubur Ayam',
      description: nil,
      price: 10000.0
    )

    menu.valid?

    expect(menu.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without a price' do
    menu = Menu.new(
      name: 'Bubur Ayam',
      description: 'Bubur ayam is a Chinese Indonesian chicken congee. It is rice congee with shredded chicken meat served with some condiments',
      price: nil
    )

    menu.valid?

    expect(menu.errors[:price]).to include("can't be blank")
  end

  it 'check food price is numeric only' do
    menu = Menu.new(
      name: 'Bubur Ayam',
      description: 'Bubur ayam is a Chinese Indonesian chicken congee. It is rice congee with shredded chicken meat served with some condiments',
      price: "2000s"
    )

    menu.valid?

    expect(menu.errors[:price]).to include("is not a number")
  end

  it 'check food price is is greater than equals to 0.01' do
    menu = Menu.new(
      name: 'Nasi Uduk',
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 0.001
    )

    menu.valid?

    expect(menu.errors[:price]).to include("must be greater than 0.01")
  end

  it 'check food description below 150 word' do
    menu = Menu.new(
        name: 'Nasi Uduk',
        description: 'Nasi Uduk (Rice Cooked in Coconut Milk) is originally from Jakarta and very popular in Jakarta and other cities in Indonesia. It is served for breakfast, lunch, or dinner. It is common in Indonesia to eat rice for breakfast',
        price: 0.01
    )

    menu.valid?

    expect(menu.errors[:description]).to include("150 characters is the maximum allowed")
  end
end