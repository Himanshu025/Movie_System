class TicketsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @tickets = Ticket.all
    respond_to do |format|
      format.json { render json: { tickets: @tickets }, status: :ok }
      format.html
    end
  end

  def new
    @ticket = Ticket.new
    respond_to do |format|
      format.json { render json: { ticket: @ticket},status: :ok }
      format.html
    end
  end

  def edit
    begin
      @ticket = Ticket.find(params[:id])
      respond_to do |format|
        format.json { render json: { ticket: @ticket},status: :ok }
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
    @ticket = Ticket.create(ticket_params)
    if @ticket.save
      respond_to do |format|
        format.json { render json: { ticket: @ticket }, status: :ok }
        format.html  
      end
    else
      respond_to do |format|
        format.json { render json: { message: 'Ticket Not Added' }, status: :unprocessable_entity }
        format.html 
      end
    end
  end

  def show
    begin
      @ticket = Ticket.find(params[:id])
      respond_to do |format|
        format.json { render json: { ticket: @ticket }, status: :ok }
        format.html
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(ticket_params)
      respond_to do |format|
        format.json { render json: { ticket: @ticket }, status: :ok }
        format.html 
      end
    else
      respond_to do |format|
        format.json { render json: { message: @ticket.errors }, status: :unprocessable_entity }
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
      @ticket = Ticket.find(params[:id])
      @ticket.destroy
      respond_to do |format|
        format.json { render json: { message: 'Deleted' }, status: :ok }
        format.html 
      end
    rescue Exception => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number, :booking_id )
  end
end
