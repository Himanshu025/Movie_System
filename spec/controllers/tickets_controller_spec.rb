require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  user = FactoryGirl.create(:user)
  movie = FactoryGirl.create(:movie)
  theatre = FactoryGirl.create(:theatre)
  audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
  show_time = FactoryGirl.create(:show_time, audi_id:audi.id)
  booking = FactoryGirl.create(:booking,user_id:user.id, show_time_id:show_time.id) 
  ticket = FactoryGirl.create(:ticket, booking_id:booking.id)
  context 'GET' do
    it 'should be a valid Show Action' do
      get :show , id: ticket.id, format: 'json'
      response.should have_http_status(:ok)
    end 
    it 'should not be a valid Show Action' do 
      get :show, id:'' , format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Show Action' do 
      get :show, id:'bnabnban', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should be a valid New Action' do 
      get :new , format:'json'
      response.should have_http_status(:ok) 
    end
    it'should be a valid Index Action' do 
      tickets = Ticket.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      get :edit , id:ticket.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      get :edit, id:'ajhgahj' , format:'json', ticket:{ number:'' , booking_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      post :create, format:'json', ticket:{ number:Faker::Number.number(5) , booking_id:booking.id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      post :create, format:'json', ticket:{ number:'' , booking_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      put :update, format:'json', id:ticket.id, ticket:{ number:ticket.number , booking_id:ticket.booking_id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      put :update, format:'json', id:ticket.id, ticket:{ number:'' , booking_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      put :update, format:'json', id:'', ticket:{ number:'' , booking_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      delete :destroy, format:'json', id:ticket.id 
      response.should have_http_status(:ok)
    end  
    it 'should not be a valid Destroy Action' do 
      delete :destroy, format:'json', id:'hahjahka'
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should be a valid Destroy Action' do 
      delete :destroy, format:'json', id:''
      response.should have_http_status(:unprocessable_entity)
    end 
  end
end