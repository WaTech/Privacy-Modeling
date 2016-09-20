class Admin::RulesController < ApplicationController
  def index
    @rules = Rule.all.page params[:page]
  end

  def update
  end
end
