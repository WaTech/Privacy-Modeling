class DashboardsController < ApplicationController
  def show
    condition = {
      category_id: dashboard_params[:category_ids] || Category.pluck(:id),
      personal_information_item_id: dashboard_params[:pii_ids],
      use_item_id: dashboard_params[:use_item_ids]
    }

    @grouped_rules = if params[:law_type].present?
                  Rule.where(condition).group_by(&:restriction)
                else
                  Rule.where(condition).group_by(&:restriction).filter_of_law(dashboard_params[:law_type])
                end

    respond_to do |format|
      format.html  # show.html.slim
      format.json  { render :json => @grouped_rules }
    end
  end

  def dashboard_params
    @dashboard_params ||= params.require(:dashboard).permit(:law_type, category_ids: [], pii_ids: [], use_item_ids: [])
  end
end
