class Admin::UseItemsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @records_total = UseItem.count
    @draw = params[:draw].to_i
    @use_items = @use_items.order(:id).page(page_number)
  end

  def new
  end

  def edit
  end

  def update
    if @use_item.update(use_item_params)
      flash.now[:success] = 'Use item succefully updated.'
    else
      flash.now[:error] = @use_item.error.messages.join('. ')
    end
  end

  def destroy
    if @use_item.destroy
      flash.now[:success] = 'Use item succefully deleted.'
    else
      flash.now[:error] = @use_item.errors.join('. ')
    end
  end

  def create
    @use_item = UseItem.new(use_item_params)

    if @use_item.save
      flash.now[:success] = 'Use item succefully created.'
    else
      flash.now[:error] = @use_item.error.messages.join('. ')
    end
  end

  private

  def page_number
    params[:start].to_i / PAGE_LENGTH + 1
  end

  def use_item_params
    params.require(:use_item).permit(:name)
  end

end
