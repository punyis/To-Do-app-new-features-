class CategoriesController < ApplicationController
    before_action :set_category, only: %i[show edit update destroy]
  
    def index
      @categories = Category.all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to categories_path, notice: "Category was successfully created."
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @category.update(category_params)
        redirect_to categories_path, notice: "Category was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
    
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@category)}_container") }
        format.html { redirect_to categories_path, notice: "Category was successfully destroyed." }
        format.json { head :no_content }
      end
    end
    

    def show

        @category = Category.find(params[:id])
        @todos = @category.todos
      rescue ActiveRecord::RecordNotFound
        redirect_to categories_path, alert: "Category not found."
      end
    end
  
    private
  
    def set_category
      @category = Category.find(params[:id])
    end
  
    def category_params
      params.require(:category).permit(:name)
    end
  
  