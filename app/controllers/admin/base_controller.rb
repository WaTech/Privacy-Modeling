class Admin::BaseController < ApplicationController
  PAGE_LENGTH = 15

  before_action :authenticate_user!

  layout 'admin'
end
