class FactoriesController < ApplicationController
  def index
    @factories = Factory.all
  end

  def create
    @factory = Factory.new(factory_params)

    if @factory.save
      redirect_to @factory
    else
      render 'new'
    end
  end

  def new
    @factory = Factory.new
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
      params.require(:factory).permit(:name, :email, :address1, :address2, :city, :state, :zipcode, :tags)
    end
end
