class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @bookings = Booking.all
    respond_to do |format|
      format.json { render json: { bookings: @bookings }, status: :ok }
      format.html
    end
  end

  def new
    @booking = Booking.new
    respond_to do |format|
      format.json { render json: { booking: @booking},status: :ok }
      format.html
    end
  end

  def edit
    begin
      @booking = Booking.find(params[:id])
      respond_to do |format|
        format.json { render json: { booking: @booking},status: :ok }
        format.html
      end
    rescue Exception => e
      respond_to do |format|
        format.json { render json: { message: e.message }, status: :unprocessable_entity }
        format.html 
      end
    end
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.save
      respond_to do |format|
        format.json { render json: { booking: @booking }, status: :ok }
        format.html  
      end
    else
      respond_to do |format|
        format.json { render json: { message: 'Booking Not Added' }, status: :unprocessable_entity }
        format.html 
      end
    end
  end

  def show
    begin
      @booking = Booking.find(params[:id])
      respond_to do |format|
        format.json { render json: { booking: @booking }, status: :ok }
        format.html
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update_attributes(booking_params)
      respond_to do |format|
        format.json { render json: { booking: @booking }, status: :ok }
        format.html 
      end
    else
      respond_to do |format|
        format.json { render json: { message: @booking.errors }, status: :unprocessable_entity }
        format.html 
      end
    end
  rescue Exception => e
    respond_to do |format|
      format.json { render json: { message: e.message }, status: :unprocessable_entity }
      format.html 
    end
  end

  def destroy
    begin
      @booking = Booking.find(params[:id])
      @booking.destroy
      respond_to do |format|
        format.json { render json: { message: 'Deleted' }, status: :ok }
        format.html 
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:seats_no, :payment_method, :user_id, :show_time_id )
  end
end
