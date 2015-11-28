class MealsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def create_meal
    @meal = Meal.create(user_id: params[user_id], meats_id: params[meats_id], type: params[:meal_type])

  end
end
