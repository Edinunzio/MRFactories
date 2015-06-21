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
    @factory = Factory.find(params[:id])
  end

  def show
    @factory = Factory.find(params[:id])
  end

  def update
    @factory = Factory.find(params[:id])

    if @factory.update(factory_params)
      redirect_to @factory
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

    def factory_params
      params.require(:factory).permit(:name, :email, :address1, :address2, :city, :state, :zipcode, :tags)
    end
end
