class Admin::PersonalInformationItemsController < Admin::BaseController
  PAGE_LENGTH = 5

  load_and_authorize_resource

  def index
    @records_total = PersonalInformationItem.count
    @draw = params[:draw].to_i

    @personal_information_items = @personal_information_items.order(:id).page(page_number)
  end

  def new
  end

  def create
    @personal_information_item = PersonalInformationItem.new(personal_information_item_params)

    if @personal_information_item.save
      flash.now[:success] = 'personal_information_item succefully created.'
    else
      flash.now[:error] = @personal_information_item.error.messages.join('. ')
    end
  end

  def edit
  end

  def update
    if @personal_information_item.update(personal_information_item_params)
      flash.now[:success] = 'personal_information_item succefully updated.'
    else
      flash.now[:error] = @personal_information_item.error.messages.join('. ')
    end
  end

  def destroy
    if @personal_information_item.destroy
      flash.now[:success] = 'personal_information_item succefully deleted.'
    else
      flash.now[:error] = @personal_information_item.errors.join('. ')
    end
  end

  private

  def personal_information_item_params
    params.require(:personal_information_item).permit(:name)
  end



  def page_number
    params[:start].to_i / PAGE_LENGTH + 1
  end

end
