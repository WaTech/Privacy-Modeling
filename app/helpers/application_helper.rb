module ApplicationHelper
  def section_nav_tag nav_step
    content_tag_class = nav_step == @step || past_step?(nav_step) ? 'active' : nil rescue 'active'
    content_tag :section, I18n.t(nav_step), class: content_tag_class
  end
end
