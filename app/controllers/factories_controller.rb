class FactoriesController < ApplicationController
  def index
  end

  def create
    @factory = Factory.new(factory_params)

    @factory.save
    redirect_to @factory
  end

  def new

  end

  def edit

  end

  def show
    @factory = Factory.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
    def factory_params
      params.require(:factories).permit(:name, :email, :address1, :address2, :city, :state, :zipcode, :tags)
    end
end
