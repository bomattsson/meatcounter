class MeatsController < ApplicationController
  #impressionist :actions => [:index]

  before_action :authenticate_user!, :except => [:index]

  def index
    @meats = Meat.all
  end

  def new
    @meat = Meat.new
  end

  def create
    @meat = Meat.create(meat_params)
    redirect_to '/meats'
  end

  def show
    @meat = Meat.find(params[:id])
  end

  def edit
    @meat = Meat.find(params[:id])
  end

  def update
    @meat = Meat.find(params[:id])
    @meat.update(meat_params)
    redirect_to meat_path(@meat)
  end

  def destroy
    @meat = Meat.find(params[:id])
    @meat.destroy
    flash[:notice] = "#{@meat.name} deleted"
    redirect_to meats_path
  end

  def weekview
    @meats = Meat.all
    render :weekview
  end

  private

  def meat_params
    params.require(:meat).permit(:name)
  end


end
