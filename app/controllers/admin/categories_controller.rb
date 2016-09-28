class Admin::CategoriesController < Admin::BaseController
  PAGE_LENGTH = 5

  load_and_authorize_resource

  def index
    @records_total = Category.count
    @draw = params[:draw].to_i
    @categories = @categories.order(:id).page(page_number)
  end

  def new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash.now[:success] = 'Use item succefully created.'
    else
      flash.now[:error] = @category.error.messages.join('. ')
    end
  end

  def edit
    raise NotImplementedError
  end

  def update
    raise NotImplementedError
  end

  def destroy
    raise NotImplementedError
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def page_number
    params[:start].to_i / PAGE_LENGTH + 1
  end
end
