class RolesController < ApplicationController
  before_action :find_role, only: [:edit, :update, :show]
  
  def index
    respond_to do |format|
      @roles = Role.all
      format.html
    end
  end

  def show
    
  end

  def new
    @role = Role.new
    #render partial: 'form'
  end

  def create
    @role = Role.new(params_role)
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Se guardó correctamente' }
      else
        format.html { render :new, notice: 'Ocurrió un error' }
      end
    end
  end

  def edit
    #render partial: 'form'
  end

  def update
    respond_to do |format|
      if @role.update(params_role)
        format.html { redirect_to @role, notice: 'Se actualizó correctamente' }
      else
        format.html { render :edit, notice: 'Ocurrió un error' }
      end
    end
  end

  private
    def params_role
      params.require(:role).permit(:name)
    end

  def find_role
    @role = Role.find(params[:id])
  end

end