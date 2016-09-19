class Admin::RulesController < ApplicationController
  def index
    @rules = Rule.all
  end

  def update
  end
end
