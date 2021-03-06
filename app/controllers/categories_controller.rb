class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :admin_required

  # GET /categories
  # GET /categories.json
  def index
   @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @product = Product.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /categories/new
  def new
   @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
   @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end

  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
   # respond_to do |format|
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  # end
  end

  def destroy
   @category.destroy
   redirect_to categories_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
   params.require(:category).permit(:name)
  end
end
# end
