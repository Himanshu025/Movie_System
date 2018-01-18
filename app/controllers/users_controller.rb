class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: { users: @users }, status: :ok }
      format.html
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.json { render json: { user: @user},status: :ok }
      format.html
    end
  end

  def edit
    begin
      @user = User.find(params[:id])
      respond_to do |format|
        format.json { render json: { user: @user},status: :ok }
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
    @user = User.create(user_params)
    if @user.save
      respond_to do |format|
        format.json { render json: { user: @user }, status: :ok }
        format.html  
      end
    else
      respond_to do |format|
        format.json { render json: { message: 'User Not Added' }, status: :unprocessable_entity }
        format.html 
      end
    end
  end

  def show
    begin
      @user = User.find(params[:id])
      respond_to do |format|
        format.json { render json: { user: @user }, status: :ok }
        format.html
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      respond_to do |format|
        format.json { render json: { user: @user }, status: :ok }
        format.html 
      end
    else
      respond_to do |format|
        format.json { render json: { message: @user.errors }, status: :unprocessable_entity }
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
      @user = User.find(params[:id])
      @user.destroy
      respond_to do |format|
        format.json { render json: { message: 'Deleted' }, status: :ok }
        format.html 
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :location, :phone, :email )
  end
end
