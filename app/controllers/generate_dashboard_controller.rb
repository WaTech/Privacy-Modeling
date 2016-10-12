class GenerateDashboardController < ApplicationController
  include Wicked::Wizard

  steps :select_categories, :select_piis, :select_use_items

  def show
    @dashboard = Dashboard.new(generate_dashboard_params)
    render_wizard
  end

  def generate_dashboard_params
    @generate_dashboard_params ||= params.require(:dashboard).permit(category_ids: [], pii_ids: [], use_item_ids: [])
  end

  def finish_wizard_path
    dashboard_path(dashboard: @dashboard.serialize)
  end
end
