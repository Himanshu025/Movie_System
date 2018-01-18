class TheatresController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @theatres = Theatre.all
    respond_to do |format|
      format.json { render json: { theatres: @theatres }, status: :ok }
      format.html
    end
  end

  def new
    @theatre = Theatre.new
    respond_to do |format|
      format.json { render json: { theatre: @theatre},status: :ok }
      format.html
    end
  end

  def edit
    begin
      @theatre = Theatre.find(params[:id])
      respond_to do |format|
        format.json { render json: { theatre: @theatre},status: :ok }
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
    @theatre = Theatre.create(theatre_params)
    if @theatre.save
      respond_to do |format|
        format.json { render json: { theatre: @theatre }, status: :ok }
        format.html  
      end
    else
      respond_to do |format|
        format.json { render json: { message: 'Theatre Not Added' }, status: :unprocessable_entity }
        format.html 
      end
    end
  end

  def show
    begin
      @theatre = Theatre.find(params[:id])
      respond_to do |format|
        format.json { render json: { theatre: @theatre }, status: :ok }
        format.html
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  def update
    @theatre = Theatre.find(params[:id])
    if @theatre.update_attributes(theatre_params)
      respond_to do |format|
        format.json { render json: { theatre: @theatre }, status: :ok }
        format.html 
      end
    else
      respond_to do |format|
        format.json { render json: { message: @theatre.errors }, status: :unprocessable_entity }
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
      @theatre = Theatre.find(params[:id])
      @theatre.destroy
      respond_to do |format|
        format.json { render json: { message: 'Deleted' }, status: :ok }
        format.html 
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def theatre_params
    params.require(:theatre).permit(:name, :category, :location )
  end
end
