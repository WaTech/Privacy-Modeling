class Admin::UseItemsController < Admin::BaseController
  PAGE_LENGTH = 5

  load_and_authorize_resource

  def index
    @records_total = UseItem.count
    @draw = params[:draw].to_i
    @use_items = @use_items.order(:id).page(page_number)
  end

  private

  def page_number
    params[:start].to_i / PAGE_LENGTH + 1
  end

end
