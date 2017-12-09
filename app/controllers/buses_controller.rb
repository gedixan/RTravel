class BusesController < ApplicationController

  def index
    respond_to do |format|
      @buses = Bus.all
      format.html
    end
  end

  def show
    respond_to do |format|
      @bus = Bus.find(params[:id])
      format.html
      format.json { render json: @bus }
    end
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(params_bus)
    respond_to do |format|
      if @bus.save
        format.html { redirect_to buses_path, notice: 'Se guardó correctamente' }
      else
        format.html { render action: 'new', notice: 'Ocurrió un error' }
      end
    end
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
    respond_to do |format|
      if @bus.update(params_bus)
        format.html { redirect_to buses_path, notice: 'Se actualizo correctamente' }
      else
        format.html { render action: 'edit', notice: 'Ocurrió un error' }
      end
    end
  end

  def destroy
    @bus = Bus.find(params[:id])
    respond_to do |format|
      if @bus.destroy
        format.html { redirect_to buses_path, notice: 'Se elimino correctamente' }
      else
        format.html { redirect_to buses_path, notice: 'Ocurrio un error' }
      end
    end
  end

  private
  def params_bus
    params.require(:bus).permit(:name, :num_policy, :status)
  end
end
