class Admin::RulesController < ApplicationController
  PAGE_LENGTH = 5

  def index
    @records_total = Rule.count
    @draw = params[:draw].to_i
    @rules = Rule.all.page(page_number)
  end

  def update
  end

  private

  def page_number
    params[:start].to_i / PAGE_LENGTH + 1
  end
end
