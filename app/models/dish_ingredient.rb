class DishIngredient < ApplicationRecord

    belongs_to :dish
    belongs_to :ingredient
    has_many :chefs, through: :dish

end