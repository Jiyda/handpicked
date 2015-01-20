class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      flash[:success] = 'Your category is created successfully'
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Your category is updated successfully'
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Your category is deleted successfully'
    redirect_to categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
