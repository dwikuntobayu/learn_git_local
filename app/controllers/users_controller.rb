class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    @url_host = request.host
    if @user.save
      begin
        #HeroMailer.htm_mail("#{@user.email}", @user.activation_token).deliver
        ConfirmationMailer.confirm_email("#{@user.email}", @url_host, @user.activation_token).deliver
      rescue
        flash[:notice] = "activation instruction fails send to your email"
      end
      flash[:notice] = "activation instruction has send to #{@user.email}"
      redirect_to root_url
    else
      flash[:error] = "data not valid"
      render "new"
    end
  end

  def edit
  end

  private
    def params_user
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :activation_token, :activation_status)
    end
end
