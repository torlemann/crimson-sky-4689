class ChefIngredientsController < ApplicationController
    def index
        @chef = Chef.find(params[:id])
        #need to find by chef's id
    end
end