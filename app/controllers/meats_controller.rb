class MeatsController < ApplicationController
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

  private

  def meat_params
    params.require(:meat).permit(:name)
  end


end
