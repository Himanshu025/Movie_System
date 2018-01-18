require 'rails_helper'

RSpec.describe ShowTimesController, type: :controller do
  context 'GET' do
    it 'should be a valid Show Action' do 
      show_time = FactoryGirl.create(:show_time)
      get :show , id: show_time.id, format: 'json'
      response.should have_http_status(:ok)
    end 
    it 'should not be a valid Show Action' do 
      show_time = FactoryGirl.create(:show_time)
      get :show, id:'' , format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Show Action' do 
      show_time = FactoryGirl.create(:show_time)
      get :show, id:'bnabnban', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should be a valid New Action' do 
      show_time = FactoryGirl.create(:show_time)
      get :new , format:'json'
      response.should have_http_status(:ok) 
    end
    it'should be a valid Index Action' do 
      show_times = ShowTime.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      show_time = FactoryGirl.create(:show_time)
      get :edit , id:show_time.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      show_time = FactoryGirl.create(:show_time)
      get :edit, id:'ajhgahj' , format:'json', show_time:{ start_time:'' , end_time:'', audi_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      show_time = FactoryGirl.create(:show_time)
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      show_time = FactoryGirl.create(:show_time)
      post :create, format:'json', show_time:{ start_time:show_time.start_time , end_time:show_time.end_time, audi_id:show_time.audi_id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      show_time = FactoryGirl.create(:show_time)
      post :create, format:'json', show_time:{ start_time:'' , end_time:'', audi_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      show_time = FactoryGirl.create(:show_time)
      put :update, format:'json', id:show_time.id, show_time:{ start_time:show_time.start_time , end_time:show_time.end_time, audi_id:show_time.audi_id }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      show_time = FactoryGirl.create(:show_time)
      put :update, format:'json', id:show_time.id, show_time:{ start_time:'' , end_time:'', audi_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      show_time = FactoryGirl.create(:show_time)
      put :update, format:'json', id:'', show_time:{ start_time:'' , end_time:'', audi_id:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      show_time = FactoryGirl.create(:show_time)
      delete :destroy, format:'json', id:show_time.id 
      response.should have_http_status(:ok)
    end  
    it 'should not be a valid Destroy Action' do 
      show_time = FactoryGirl.create(:show_time)
      delete :destroy, format:'json', id:'hahjahka'
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should be a valid Destroy Action' do 
      show_time = FactoryGirl.create(:show_time)
      delete :destroy, format:'json', id:''
      response.should have_http_status(:unprocessable_entity)
    end 
  end
end