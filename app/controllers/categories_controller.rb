class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_required, except: [:index, :show]

  def index
    # Load in ApplicationController#load_categories
  end

  def show
  end

  def new
    @category = Category.new
    @category.names = {}
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.names = params[:category][:names]

    if @category.save
      redirect_to :categories, notice: I18n.t('flash.models.create', model: Category.model_name.human) 
    else
      render action: 'new'
    end
  end

  def update
    @category.names = params[:category][:names]
    if @category.update(category_params)
      redirect_to :categories, notice: I18n.t('flash.models.update', model: Category.model_name.human) 
    else
      render action: 'edit'
    end
  end

  def destroy
    if @category == @categories.first 
      redirect_to :categories 
      return
    end

    @category.destroy
    redirect_to categories_url, notice: I18n.t('flash.models.destroy', model: Category.model_name.human) 
  end

private
  def set_category
    @category = Category.find_by!(slug: params[:id])
  end

  def category_params
    params.require(:category).permit(:names, :slug)
 end

end
