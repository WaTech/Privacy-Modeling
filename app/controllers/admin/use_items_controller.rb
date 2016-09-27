class Admin::UseItemsController < Admin::BaseController
  PAGE_LENGTH = 5

  load_and_authorize_resource

  def index
    @records_total = UseItem.count
    @draw = params[:draw].to_i
    @use_items = @use_items.order(:id).page(page_number)
  end

  def create
    @use_item = UseItem.new(use_item_params)
    if @use_item.save
      flash.now[:success] = 'Use item succefully created.'
    else
      flash.now[:error] = @user_item.error.messages.join('. ')
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
