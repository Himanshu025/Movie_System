require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  context 'GET' do
    it 'should be a valid Show Action' do 
      ticket = FactoryGirl.create(:ticket)
      get :show , id: ticket.id, format: 'json'
      response.should have_http_status(:ok)
    end 
    it 'should not be a valid Show Action' do 
      ticket = FactoryGirl.create(:ticket)
      get :show, id:'' , format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Show Action' do 
      ticket = FactoryGirl.create(:ticket)
      get :show, id:'bnabnban', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should be a valid New Action' do 
      ticket = FactoryGirl.create(:ticket)
      get :new , format:'json'
      response.should have_http_status(:ok) 
    end
    it'should be a valid Index Action' do 
      tickets = Ticket.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      ticket = FactoryGirl.create(:ticket)
      get :edit , id:ticket.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      ticket = FactoryGirl.create(:ticket)
      get :edit, id:'ajhgahj' , format:'json', ticket:{ number:'' , booking_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      ticket = FactoryGirl.create(:ticket)
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      ticket = FactoryGirl.create(:ticket)
      post :create, format:'json', ticket:{ number:ticket.number , booking_id:ticket.booking_id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      ticket = FactoryGirl.create(:ticket)
      post :create, format:'json', ticket:{ number:'' , booking_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      ticket = FactoryGirl.create(:ticket)
      put :update, format:'json', id:ticket.id, ticket:{ number:ticket.number , booking_id:ticket.booking_id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      ticket = FactoryGirl.create(:ticket)
      put :update, format:'json', id:ticket.id, ticket:{ number:'' , booking_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      ticket = FactoryGirl.create(:ticket)
      put :update, format:'json', id:'', ticket:{ number:'' , booking_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      ticket = FactoryGirl.create(:ticket)
      delete :destroy, format:'json', id:ticket.id 
      response.should have_http_status(:ok)
    end  
    it 'should not be a valid Destroy Action' do 
      ticket = FactoryGirl.create(:ticket)
      delete :destroy, format:'json', id:'hahjahka'
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should be a valid Destroy Action' do 
      ticket = FactoryGirl.create(:ticket)
      delete :destroy, format:'json', id:''
      response.should have_http_status(:unprocessable_entity)
    end 
  end
end