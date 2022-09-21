require 'rails_helper'

RSpec.describe 'Ingredient Index' do

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
    @shrimp = Ingredient.create!(name: "Shrimp", calories: 50)
    
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

  it "shows unique list of ingredient names that chef uses" do

    visit "/chef/#{@chef.id}/ingredients"
    
    expect(page).to have_content("#{@chef.name}'s Ingredients List")
    # expect(page).to have_content(@mac.name)
    # expect(page).to have_content(@cheese.name)
    # expect(page).to have_content(@tuna.name)
    # expect(page).to have_content(@mayo.name)
    # expect(page).to have_content(@salt.name)
    # expect(page).to have_content(@pep.name)
    # expect(page).to have_content(@cel.name)
    # expect(page).to have_content(@dij.name)
    # expect(page).to have_content(@corni.name)
    # expect(page).to_not have_content(@shrimp.name)
  end
end