class GenerateDashboardController < ApplicationController
  include Wicked::Wizard

  steps :select_categories, :select_piis, :select_use_items

  def show
    @dashboard = Dashboard.new(generate_dashboard_params)
    render_wizard
  end

  def generate_dashboard_params
    @generate_dashboard_params ||= params.fetch(:dashboard, {}).permit(category_ids: [], pii_ids: [], use_item_ids: [])
    @generate_dashboard_params[:category_ids] = @generate_dashboard_params[:category_ids].select(&:present?) rescue ['']
    @generate_dashboard_params[:category_ids] = Category.pluck(:id).map(&:to_s) unless @generate_dashboard_params[:category_ids].present?
    @generate_dashboard_params
  end

  def finish_wizard_path
    dashboard_path(dashboard: @dashboard.serialize)
  end
end
