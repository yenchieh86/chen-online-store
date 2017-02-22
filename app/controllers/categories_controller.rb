class CategoriesController < ApplicationController
  before_action :check_title, only: [:create, :update, :delete]
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.create(category_params)
    authorize @category
    if @category.save
      flash[:notice] = "You added a new category!"
      redirect_to categories_path
    else
      flash[:alert] = @category.errors.full_messages
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    authorize @category
    
    if @category.update(category_params)
      flash[:notice] ="You updated <#{@category.title}>'s informations."
      redirect_to category_path(@category)
    else
      flash[:alert] = @category.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    authorize @category
    
    if @category.delete
      flash[:notice] = 'Category has been deleted!'
      redirect_to categories_path
    else
      flash[:alert] = @category.errors.full_messages
      render categories_path
    end
  end
  
  private
    
    def category_params
      params.require(:category).permit(:title, :body)
    end
    
    def check_title
      params[:category][:title] = params[:category][:title].upcase_first
      params[:category][:body] = params[:category][:body].upcase_first
    end
end
