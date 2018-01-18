require 'rails_helper'

RSpec.describe TheatresController, type: :controller do
  context 'GET' do
    it 'should be a valid Show Action' do 
      theatre = FactoryGirl.create(:theatre)
      get :show , id: theatre.id, format: 'json'
      response.should have_http_status(:ok)
    end 
    it 'should not be a valid Show Action' do 
      theatre = FactoryGirl.create(:theatre)
      get :show, id:'' , format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Show Action' do 
      theatre = FactoryGirl.create(:theatre)
      get :show, id:'bnabnban', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should be a valid New Action' do 
      theatre = FactoryGirl.create(:theatre)
      get :new , format:'json'
      response.should have_http_status(:ok) 
    end
    it'should be a valid Index Action' do 
      theatres = Theatre.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      theatre = FactoryGirl.create(:theatre)
      get :edit , id:theatre.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      theatre = FactoryGirl.create(:theatre)
      get :edit, id:'ajhgahj' , format:'json', theatre:{ name:'' , category:'', location:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      theatre = FactoryGirl.create(:theatre)
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      theatre = FactoryGirl.create(:theatre)
      post :create, format:'json', theatre:{ name:theatre.name , category:theatre.category, location:theatre.location }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      theatre = FactoryGirl.create(:theatre)
      post :create, format:'json', theatre:{ name:'' , category:'', location:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      theatre = FactoryGirl.create(:theatre)
      put :update, format:'json', id:theatre.id, theatre:{ name:theatre.name , category:theatre.category, location:theatre.location }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      theatre = FactoryGirl.create(:theatre)
      put :update, format:'json', id:theatre.id, theatre:{ name:'' , category:'', location:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      theatre = FactoryGirl.create(:theatre)
      put :update, format:'json', id:'', theatre:{ name:'' , category:'', location:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      theatre = FactoryGirl.create(:theatre)
      delete :destroy, format:'json', id:theatre.id 
      response.should have_http_status(:ok)
    end  
    it 'should not be a valid Destroy Action' do 
      theatre = FactoryGirl.create(:theatre)
      delete :destroy, format:'json', id:'hahjahka'
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should be a valid Destroy Action' do 
      theatre = FactoryGirl.create(:theatre)
      delete :destroy, format:'json', id:''
      response.should have_http_status(:unprocessable_entity)
    end 
  end
end