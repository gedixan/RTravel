class UsersController < ApplicationController
  before_action :find_user, only: [:edit,:update,:show, :destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def new
    @user = User.new
  end

  def create
    respond_to do |format|
      @user = User.new(params_user)
      if @user.save
        format.html { redirect_to @user, notice: 'Se guardó correctamente' }
      else
        format.html { render action: 'new', notice: 'Ocurrió un error' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(params_user)
        format.html { redirect_to users_path}
      else
        format.html { render action: 'edit'}
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html {redirect_to users_path, notice: 'Se elimino correctamente'}
      else
        format.html {notice:'Sucedio un error'}
      end
    end
  end

  private
  def params_user
    params.require(:user).permit(:fname, :lname, :jobtitle, :document, :phone, :username, :email, :role_id, :status_user_id, :password, :password_confirmation)
  end
  
  def find_user
    @user = User.find(params[:id])
  end

end