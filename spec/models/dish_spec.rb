require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  before :each do
    @chef = Chef.create!(name: "Taryn")

    @dish_1 = Dish.create!(name: "Mac and Cheese", description: "Basic comfort food", chef_id: @chef.id)

    @mac = Ingredient.create!(name: "Macaroni", calories: 100)
    @cheese = Ingredient.create!(name: "Cheese", calories: 200)

    @dish_1_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @mac.id)
    @dish_1_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @cheese.id)
  end

  it "can calculate total calories of a dish" do
    expect(@dish_1.total_calories).to eq(300)
  end

  
end