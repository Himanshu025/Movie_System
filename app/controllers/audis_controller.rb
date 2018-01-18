class AudisController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @audis = Audi.all
    respond_to do |format|
      format.json { render json: { audis: @audis }, status: :ok }
      format.html
    end
  end

  def new
    @audi = Audi.new
    respond_to do |format|
      format.json { render json: { audi: @audi},status: :ok }
      format.html
    end
  end

  def edit
    begin
      @audi = Audi.find(params[:id])
      respond_to do |format|
        format.json { render json: { audi: @audi},status: :ok }
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
    @audi = Audi.create(audi_params)
    if @audi.save
      respond_to do |format|
        format.json { render json: { audi: @audi }, status: :ok }
        format.html  
      end
    else
      respond_to do |format|
        format.json { render json: { message: 'Audi Not Added' }, status: :unprocessable_entity }
        format.html 
      end
    end
  end

  def show
    begin
      @audi = Audi.find(params[:id])
      respond_to do |format|
        format.json { render json: { audi: @audi }, status: :ok }
        format.html
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  def update
    @audi = Audi.find(params[:id])
    if @audi.update_attributes(audi_params)
      respond_to do |format|
        format.json { render json: { audi: @audi }, status: :ok }
        format.html 
      end
    else
      respond_to do |format|
        format.json { render json: { message: @audi.errors }, status: :unprocessable_entity }
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
      @audi = Audi.find(params[:id])
      @audi.destroy
      respond_to do |format|
        format.json { render json: { message: 'Deleted' }, status: :ok }
        format.html 
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def audi_params
    params.require(:audi).permit(:category, :capacity, :movie_id, :theatre_id )
  end
end
