class UserGuidesController < ApplicationController
  before_action :dashboard_params

  def show
  end

  private

  def dashboard_params
    @dashboard_params ||= params.require(:dashboard).permit(category_ids: [], pii_ids: [], use_item_ids: [])
  end
end
