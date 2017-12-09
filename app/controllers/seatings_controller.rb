class SeatingsController < ApplicationController
  before_action :find_seating, only: [:edit, :update, :show, :destroy]

  def index
    respond_to do |format|
      @bus = Bus.find(params[:bus_id])
      @seatings = @bus.seatings.all
      format.html
    end
  end

  def show
    
  end

  def new
    @bus = Bus.find(params[:bus_id])
    @seating = @bus.seatings.build
  end

  def create
    @bus = Bus.find(params[:bus_id])
    @seating = @bus.seatings.build(params_seating)
    respond_to do |format|
      if @seating.save
        format.html { redirect_to bus_seatings_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @bus = Bus.find(params[:bus_id])
    @seating = @bus.seatings.find(params[:id])
  end

  def update
    if @seating.update(params_seating)
      redirect_to bus_seatings_path
    else
      redirect_to bus_seatings_path
    end
  end

  def destroy
    @seating.destroy
    flash[:notice] = "Eliminado correctamente"
    redirect_to bus_seatings_path
  end

  private
  def find_seating
    @seating = Seating.find(params[:id])
  end

  def params_seating
    params.require(:seating).permit(:name, :status)
  end
end
