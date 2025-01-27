require 'rails_helper'

RSpec.describe 'Dish Show' do

  before :each do
    @chef = Chef.create!(name: "Taryn")

    @dish_1 = Dish.create!(name: "Mac and Cheese", description: "Basic comfort food", chef_id: @chef.id)

    @mac = Ingredient.create!(name: "Macaroni", calories: 100)
    @cheese = Ingredient.create!(name: "Cheese", calories: 200)

    @dish_1_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @mac.id)
    @dish_1_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @cheese.id)
  end

  describe "user story 1" do
    it "shows attributes of dish" do
      visit "/chef/#{@chef.id}/dishes/#{@dish_1.id}"

      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
    end

    it "shows chef name and ingredients of dish" do
      visit "/chef/#{@chef.id}/dishes/#{@dish_1.id}"

      expect(page).to have_content(@chef.name)
      expect(page).to have_content(@mac.name)
      expect(page).to have_content(@cheese.name)
    end
  end

  describe "user story 2" do
    it "shows total calories in dish" do
      visit "/chef/#{@chef.id}/dishes/#{@dish_1.id}"

      expect(page).to have_content("#{@dish_1.total_calories} calories")
    end
  end
  
end