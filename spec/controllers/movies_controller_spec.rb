require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  context 'GET' do
    it 'should be a valid Show Action' do 
      movie = FactoryGirl.create(:movie)
      get :show , id: movie.id, format: 'json'
      response.should have_http_status(:ok)
    end 
    it 'should not be a valid Show Action' do 
      movie = FactoryGirl.create(:movie)
      get :show, id:'' , format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Show Action' do 
      movie = FactoryGirl.create(:movie)
      get :show, id:'bnabnban', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should be a valid New Action' do 
      movie = FactoryGirl.create(:movie)
      get :new , format:'json'
      response.should have_http_status(:ok) 
    end
    it'should be a valid Index Action' do 
      movies = Movie.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      movie = FactoryGirl.create(:movie)
      get :edit , id:movie.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      movie = FactoryGirl.create(:movie)
      get :edit, id:'ajhgahj' , format:'json', movie:{ title:'' , year:'', duration:'', cast:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      movie = FactoryGirl.create(:movie)
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      movie = FactoryGirl.create(:movie)
      post :create, format:'json', movie:{ title:movie.title , year:movie.year, duration:movie.duration, cast:movie.cast }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      movie = FactoryGirl.create(:movie)
      post :create, format:'json', movie:{ title:'' , year:'', duration:'', cast:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      movie = FactoryGirl.create(:movie)
      put :update, format:'json', id:movie.id, movie:{ title:movie.title , year:movie.year, duration:movie.duration, cast:movie.cast }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      movie = FactoryGirl.create(:movie)
      put :update, format:'json', id:movie.id, movie:{ title:'' , year:'', duration:'', cast:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      movie = FactoryGirl.create(:movie)
      put :update, format:'json', id:'', movie:{ title:'' , year:'', duration:'', cast:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      movie = FactoryGirl.create(:movie)
      delete :destroy, format:'json', id:movie.id 
      response.should have_http_status(:ok)
    end  
    it 'should not be a valid Destroy Action' do 
      movie = FactoryGirl.create(:movie)
      delete :destroy, format:'json', id:'hahjahka'
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should be a valid Destroy Action' do 
      movie = FactoryGirl.create(:movie)
      delete :destroy, format:'json', id:''
      response.should have_http_status(:unprocessable_entity)
    end 
  end
end