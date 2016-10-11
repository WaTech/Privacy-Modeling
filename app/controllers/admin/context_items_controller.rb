class Admin::ContextItemsController < Admin::BaseController
  load_and_authorize_resource

  def create
    context_item = ContextItem.new context_item_params.merge(rule_id: params[:rule_id])

    if context_item.save
      render json: {}, status: :ok
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def edit
  end


  def update
    if @context_item.update(context_item_params)
      flash.now[:success] = 'Context item succefully updated.'
    else
      flash.now[:error] = @context_item.errors.full_messages.join('. ')
    end
  end

  def destroy
    if @context_item.destroy
      flash.now[:success] = 'Context item succefully deleted.'
    else
      flash.now[:error] = @context_item.errors.join('. ')
    end
  end

  private

  def context_item_params
    params.require(:context_item).permit(:category, :description, :source)
  end
end
