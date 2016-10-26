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
    @user = User.new(user_params)

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
    params.require(:user).permit(:email, :role, :password)
  end

end
