require 'rails_helper'

RSpec.describe 'Chef Show' do

  before :each do
    @chef = Chef.create!(name: "Taryn")

    @dish_1 = Dish.create!(name: "Mac and Cheese", description: "Basic comfort food", chef_id: @chef.id)
    @dish_2 = Dish.create!(name: "Tuna Salad", description: "Favorite lunch food", chef_id: @chef.id)

    @mac = Ingredient.create!(name: "Macaroni", calories: 100)
    @cheese = Ingredient.create!(name: "Cheese", calories: 200)
    @tuna = Ingredient.create!(name: "Tuna", calories: 100)
    @mayo = Ingredient.create!(name: "Mayonnaise", calories: 100)
    @dij = Ingredient.create!(name: "Dijon", calories: 20)
    @salt = Ingredient.create!(name: "Salt", calories: 1)
    @pep = Ingredient.create!(name: "Pepper", calories: 1)
    @cel = Ingredient.create!(name: "Celery", calories: 1)
    @corni = Ingredient.create!(name: "Cornichons", calories: 20)
    
    @dish_1_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @mac.id)
    @dish_1_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @cheese.id)
    @dish_2_ingredient_1 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @tuna.id)
    @dish_2_ingredient_2 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @mayo.id)
    @dish_2_ingredient_3 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @dij.id)
    @dish_2_ingredient_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @salt.id)
    @dish_2_ingredient_5 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @pep.id)
    @dish_2_ingredient_6 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @cel.id)
    @dish_2_ingredient_7 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @corni.id)
  end

  it "shows name of chef and link to chef's ingredients" do

    visit "/chef/#{@chef.id}"
    
    expect(page).to have_content(@chef.name)
    expect(page).to have_link("All Ingredients")
    click_link "All Ingredients"
    expect(current_path).to be("/chef/#{@chef.id}/ingredients")
  end
end