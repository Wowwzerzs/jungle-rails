class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTH_ADMIN_USERNAME'], password: ENV['AUTH_ADMIN_PASSWORD']

  def index
    @categories = Category.order(id: :asc).all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to %i[admin categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :description
    )
  end
end