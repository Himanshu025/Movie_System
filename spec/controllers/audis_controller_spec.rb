require 'rails_helper'

RSpec.describe AudisController, type: :controller do  
  movie = FactoryGirl.create(:movie)
  theatre = FactoryGirl.create(:theatre)
  audi = FactoryGirl.create(:audi, movie_id:movie.id, theatre_id:theatre.id)
  context 'GET' do
    it 'should be a valid Show Action' do 
      get :show , id: audi.id, format: 'json'
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
      audis = Audi.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      get :edit , id:audi.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do
      get :edit, id:'ajhgahj' , format:'json', audi:{ category:'' , capacity:'', movie_id:'', theatre_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      theatre = FactoryGirl.create(:theatre)
      movie = FactoryGirl.create(:movie)
      post :create, format:'json', audi:{ category: Faker::Food.spice , capacity:Faker::Number.between(100, 500), movie_id:movie.id, theatre_id:theatre.id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      post :create, format:'json', audi:{ category:'' , capacity:'', movie_id:'', theatre_id:''}
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      put :update, format:'json', id:audi.id, audi:{ category:audi.category , capacity:audi.capacity, movie_id:audi.movie_id, theatre_id:audi.theatre_id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      put :update, format:'json', id:audi.id, audi:{ category:'' , capacity:'', movie_id:'', theatre_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      put :update, format:'json', id:'', audi:{ category:'' , capacity:'', movie_id:'', theatre_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      delete :destroy, format:'json', id:audi.id 
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