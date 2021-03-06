class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new,:create]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash["notice"] = "#{@category.name} was successfully created"
      redirect_to '/'
    else
      render :new
    end

  end

  def show
    @category = Category.find_by(slug: params[:id])
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end




end