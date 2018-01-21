class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @restaurants = @category.restaurants.page(params[:page]).per(9)
  end

  def destroy
    @category.destroy

    if @category.errors
      flash[:alert] = @category.errors.full_message.to_sentence
    else
      flash[:notice] = "category was sucessfully deleted"
    end

      edirect_to admin_categories_path
    end

end
