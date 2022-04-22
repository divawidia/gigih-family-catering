require 'rails_helper'

RSpec.describe MenusCategory, type: :model do
  it 'is invalid without menu id' do
    menu_category = FactoryBot.build(:menus_category, menu_id: nil)
    menu_category.valid?
    expect(menu_category.errors[:menu_id]).to include("can't be blank")
  end
  
  it 'is invalid without category id' do
    menu_category = FactoryBot.build(:menus_category, category_id: nil)
    menu_category.valid?
    expect(menu_category.errors[:category_id]).to include("can't be blank")
  end
end