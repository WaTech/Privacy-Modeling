class DashboardsController < ApplicationController
  def show
    @grouped_rules = Rule.order(id: :asc).limit(5).to_a.group_by(&:restriction)
  end

  def dashboard_params
    params.require(:dashboard).permit(category_ids: [], pii_ids: [], use_item_ids: [])
  end
end
