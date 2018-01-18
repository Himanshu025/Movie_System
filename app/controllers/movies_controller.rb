class MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @movies = Movie.all
    respond_to do |format|
      format.json { render json: { movies: @movies }, status: :ok }
      format.html
    end
  end

  def new
    @movie = Movie.new
    respond_to do |format|
      format.json { render json: { movie: @movie},status: :ok }
      format.html
    end
  end

  def edit
    begin
      @movie = Movie.find(params[:id])
      respond_to do |format|
        format.json { render json: { movie: @movie},status: :ok }
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
    @movie = Movie.create(movie_params)
    if @movie.save
      respond_to do |format|
        format.json { render json: { movie: @movie }, status: :ok }
        format.html  
      end
    else
      respond_to do |format|
        format.json { render json: { message: 'Movie Not Added' }, status: :unprocessable_entity }
        format.html 
      end
    end
  end

  def show
    begin
      @movie = Movie.find(params[:id])
      respond_to do |format|
        format.json { render json: { movie: @movie }, status: :ok }
        format.html
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movie_params)
      respond_to do |format|
        format.json { render json: { movie: @movie }, status: :ok }
        format.html 
      end
    else
      respond_to do |format|
        format.json { render json: { message: @movie.errors }, status: :unprocessable_entity }
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
      @movie = Movie.find(params[:id])
      @movie.destroy
      respond_to do |format|
        format.json { render json: { message: 'Deleted' }, status: :ok }
        format.html 
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :year, :duration, :cast )
  end
end
