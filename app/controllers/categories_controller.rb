# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :authenticate_user!          # Devise auth
  #before_action :set_category, only: %i[show edit update destroy]

 # def index
 # @categories = Category.all
 # @transactions = Transaction.all
 # end

 def index
    @categories = current_user.categories
    @transactions = current_user.transactions
  end


  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to @category, notice: "Category created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category deleted."
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
