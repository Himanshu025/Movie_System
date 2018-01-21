require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  user = FactoryGirl.create(:user)
  movie = FactoryGirl.create(:movie)
  theatre = FactoryGirl.create(:theatre)
  audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
  show_time = FactoryGirl.create(:show_time, audi_id:audi.id)
  booking = FactoryGirl.create(:booking,user_id:user.id, show_time_id:show_time.id)   
  context 'GET' do
    it 'should be a valid Show Action' do 
      get :show , id: booking.id, format: 'json'
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
      bookings = Booking.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      get :edit , id:booking.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      get :edit, id:'ajhgahj' , format:'json', booking:{ seats_no:'' , payment_method:'', user_id:'', show_time_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      post :create, format:'json', booking:{ seats_no:'s2, s3, s4' , payment_method:'netbanking' , user_id:user.id, show_time_id:show_time.id  }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      post :create, format:'json', booking:{ seats_no:'' , payment_method:'', user_id:'', show_time_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      put :update, format:'json', id:booking.id, booking:{ seats_no:booking.seats_no , payment_method:booking.payment_method , user_id:booking.user_id, show_time_id:booking.show_time_id  }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      put :update, format:'json', id:booking.id, booking:{ seats_no:'' , payment_method:'', user_id:'', show_time_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      put :update, format:'json', id:'', booking:{ seats_no:'' , payment_method:'', user_id:'', show_time_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      delete :destroy, format:'json', id:booking.id 
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