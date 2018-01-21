require 'rails_helper'

RSpec.describe TheatresController, type: :controller do
  theatre = FactoryGirl.create(:theatre)
  context 'GET' do
    it 'should be a valid Show Action' do 
      get :show , id: theatre.id, format: 'json'
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
      theatres = Theatre.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      get :edit , id:theatre.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      get :edit, id:'ajhgahj' , format:'json', theatre:{ name:'' , category:'', location:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      post :create, format:'json', theatre:{ name:Faker::DragonBall.character , category:Faker::GameOfThrones.house, location:Faker::Address.street_address }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      post :create, format:'json', theatre:{ name:'' , category:'', location:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      put :update, format:'json', id:theatre.id, theatre:{ name:theatre.name , category:theatre.category, location:theatre.location }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      put :update, format:'json', id:theatre.id, theatre:{ name:'' , category:'', location:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      put :update, format:'json', id:'', theatre:{ name:'' , category:'', location:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      delete :destroy, format:'json', id:theatre.id 
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