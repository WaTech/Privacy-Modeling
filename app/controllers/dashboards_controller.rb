class DashboardsController < ApplicationController
  def show
    @grouped_rules = Rule.where(category_id: dashboard_params[:category_ids]).where(personal_information_item_id: dashboard_params[:pii_ids]).where(use_item_id: dashboard_params[:use_item_ids]).group_by(&:restriction)
  end

  def dashboard_params
    params.require(:dashboard).permit(category_ids: [], pii_ids: [], use_item_ids: [])
  end
end
