class Admin::BaseController < ApplicationController
  PAGE_LENGTH = 15

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash.now[:error] = exception.message

    render 'admin/shared/alerts'
  end

  layout 'admin'
end
