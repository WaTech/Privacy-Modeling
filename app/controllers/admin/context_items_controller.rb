class Admin::ContextItemsController < Admin::BaseController
  def create
    context_item = ContextItem.new context_item_params.merge(rule_id: params[:rule_id])

    if context_item.save
      render json: {}, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

  def context_item_params
    params.require(:context_item).permit(:category, :description, :source)
  end
end
