class ShowTimesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @show_times = ShowTime.all
    respond_to do |format|
      format.json { render json: { show_times: @show_times }, status: :ok }
      format.html
    end
  end

  def new
    @show_time = ShowTime.new
    respond_to do |format|
      format.json { render json: { show_time: @show_time},status: :ok }
      format.html
    end
  end

  def edit
    begin
      @show_time = ShowTime.find(params[:id])
      respond_to do |format|
        format.json { render json: { show_time: @show_time},status: :ok }
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
    @show_time = ShowTime.create(show_time_params)
    if @show_time.save
      respond_to do |format|
        format.json { render json: { show_time: @show_time }, status: :ok }
        format.html  
      end
    else
      respond_to do |format|
        format.json { render json: { message: 'ShowTime Not Added' }, status: :unprocessable_entity }
        format.html 
      end
    end
  end

  def show
    begin
      @show_time = ShowTime.find(params[:id])
      respond_to do |format|
        format.json { render json: { show_time: @show_time }, status: :ok }
        format.html
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  def update
    @show_time = ShowTime.find(params[:id])
    if @show_time.update_attributes(show_time_params)
      respond_to do |format|
        format.json { render json: { show_time: @show_time }, status: :ok }
        format.html 
      end
    else
      respond_to do |format|
        format.json { render json: { message: @show_time.errors }, status: :unprocessable_entity }
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
      @show_time = ShowTime.find(params[:id])
      @show_time.destroy
      respond_to do |format|
        format.json { render json: { message: 'Deleted' }, status: :ok }
        format.html 
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def show_time_params
    params.require(:show_time).permit(:start_time, :end_time, :audi_id )
  end
end
