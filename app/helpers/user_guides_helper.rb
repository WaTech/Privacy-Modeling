module UserGuidesHelper
  def back_button_path
    if @dashboard_params.to_h.present?
      dashboard_path(dashboard: @dashboard_params.to_h)
    else
      root_url
    end
  end
end
