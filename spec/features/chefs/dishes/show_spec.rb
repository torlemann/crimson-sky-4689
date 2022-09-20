require 'rails_helper'

RSpec.describe 'Dish Show' do

  before :each do
    @chef = Chef.create!(name: "Taryn")

    @dish_1 = Dish.create!(name: "Mac and Cheese", description: "Basic comfort food", chef_id: @chef)

    @mac = Ingredient.create!(name: "Macaroni", calories: 100)
    @cheese = Ingredient.create!(name: "Cheese", calories: 200)

    @dish_1_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @mac.id)
    @dish_1_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @cheese.id)
  end

  it "shows attributes of dish" do
    visit "/chef/#{@chef.id}/dishes/#{@dish_1.id}"

    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
  end
# And I see a list of ingredients for that dish
# And I see the chef's name.
  
end