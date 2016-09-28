class Admin::CategoriesController < Admin::BaseController
  PAGE_LENGTH = 5

  load_and_authorize_resource

  def index
    @records_total = UseItem.count
    @draw = params[:draw].to_i
    @categories = @categories.order(:id).page(page_number)
  end

  def create
    raise NotImplementedError
  end

  def new
    raise NotImplementedError
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

  def page_number
    params[:start].to_i / PAGE_LENGTH + 1
  end
end
