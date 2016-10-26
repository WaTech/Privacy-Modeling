class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @records_total = User.count
    @draw = params[:draw].to_i
    @users = @users.order(:id).page(page_number)

    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
  end

  def create
    if @user.save
      Users::RegistrationMailer.send_credentials(@user).deliver_now

      flash.now[:success] = 'User succefully created.'
    else
      flash.now[:error] = @user.errors.full_messages.join('. ')
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash.now[:success] = 'User succefully updated.'
    else
      flash.now[:error] = @user.errors.full_messages.join('. ')
    end
  end

  def destroy
    if @user.destroy
      flash.now[:success] = 'User succefully deleted.'
    else
      flash.now[:error] = @user.errors.full_messagesjoin('. ')
    end
  end

 private

  def page_number
    params[:start].to_i / PAGE_LENGTH + 1
  end

  def user_params
    unless @user_params
      @user_params = params.require(:user).permit(:email, :role, :password)
      @user_params[:role] = @user_params[:role].presence_in(available_user_roles)
    end
    @user_params
  end

  def available_user_roles
    { admin: %w(admin), super_admin: %w(admin super_admin) }[current_user.role.to_sym]
  end

end
