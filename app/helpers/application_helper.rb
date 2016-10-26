module ApplicationHelper
  def section_nav_tag nav_step
    content_tag_class = nav_step == @step || past_step?(nav_step) || nav_step == :select_categories ? 'active' : nil rescue 'active'
    condition = past_step?(nav_step) rescue false
    link_id = "#{ nav_step.to_s }_nav_step"

    if condition
      link_to I18n.t(nav_step), wizard_path(nav_step, dashboard: step_params_for(nav_step)), class: [content_tag_class, :section].join(' '), id: link_id
    elsif current_page?(dashboard_path) && nav_step != :results
      link_to I18n.t(nav_step), generate_dashboard_path(nav_step, dashboard: step_params_for(nav_step)), class: [content_tag_class, :section].join(' '), id: link_id
    else
      content_tag :section, I18n.t(nav_step), class: content_tag_class
    end
  end

  def step_params_for step
    params_keys = [category_ids: [], pii_ids: [], use_item_ids: []]
    params.require(:dashboard).permit(params_keys).to_h rescue {}
  end

  def previous_step_path
    if @previous_step
      wizard_path(@previous_step, dashboard: step_params_for(@previous_step))
    end
  end

  def is_item_active(collection_name, id)
    @generate_dashboard_params[collection_name].include?(id.to_s) rescue false
  end

  def is_continue_tag_disabled
    @step && @step != :select_categories && !step_parameter
  end

  def step_parameter
    step_params = { select_piis: :pii_ids, select_use_items: :use_item_ids }
    @generate_dashboard_params[step_params[@step]].present?
  end

  def google_search_path(query_string = '')
    "https://google.com/#q=#{ query_string.split(' ').join('+') }"
  end

end


