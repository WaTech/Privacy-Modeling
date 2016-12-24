class DashboardsController < ApplicationController
  def show
    condition = {
      category_id: dashboard_params[:category_ids] || Category.pluck(:id),
      personal_information_item_id: dashboard_params[:pii_ids],
      use_item_id: dashboard_params[:use_item_ids]
    }

    rules = Rule.where(condition)
    law_types = ContextItem.where(rule_id: rules.pluck(:id)).pluck(:applicable_law_kind).uniq
    @grouped_rules = {law_types: law_types, rules: rules.group_by(&:restriction)}
  end

  def dashboard_params
    @dashboard_params ||= params.require(:dashboard).permit(:law_type, category_ids: [], pii_ids: [], use_item_ids: [])
  end
end
