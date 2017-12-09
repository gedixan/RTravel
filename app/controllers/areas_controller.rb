class AreasController < ApplicationController
  before_action :find_area, only: [:edit, :update, :destroy]

  def index
    respond_to do |format|
      @areas = Area.all
      format.html
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json{render json: @area}
    end
  end

  def new
    respond_to do |format|
      @area = Area.new
      format.html {render partial: 'form'}
    end
  end

  def create
    respond_to do |format|
      @area = Area.new(params_area)
      if @area.save!
        format.html {redirect_to areas_path, message: 'Se guardo corretamente'}
      else
        format.html {redirect_to areas_path, message: 'Ocurrio un error'}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html {render partial: 'form'}
    end
  end

  def update
    respond_to do |format|
      if @area.update!
        format.html {redirect_to areas_path, message: 'Se actualizo'}
      else
        format.html {redirect_to areas_path, message: 'Ocurrio un error'}
      end
    end
  end

  def destroy
    @area.destroy
    flash[:notice] = 'Se elimino correctamente'
    redirect_to areas_path
  end

  private
  def find_area
    @area = Area.find(params[:id])
  end
  def params_area
    params.require(:area).permit(:name, :color)
  end
end