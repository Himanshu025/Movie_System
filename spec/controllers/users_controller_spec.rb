require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET' do
    it 'should be a valid Show Action' do 
      user = FactoryGirl.create(:user)
      get :show , id: user.id, format: 'json'
      response.should have_http_status(:ok)
    end 
    it 'should not be a valid Show Action' do 
      user = FactoryGirl.create(:user)
      get :show, id:'' , format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Show Action' do 
      user = FactoryGirl.create(:user)
      get :show, id:'bnabnban', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should be a valid New Action' do 
      user = FactoryGirl.create(:user)
      get :new , format:'json'
      response.should have_http_status(:ok) 
    end
    it'should be a valid Index Action' do 
      users = User.all
      get :index , format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should be a valid Edit Action' do 
      user = FactoryGirl.create(:user)
      get :edit , id:user.id , format:'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Edit Action' do 
      user = FactoryGirl.create(:user)
      get :edit, id:'ajhgahj' , format:'json', user:{ name:'' , location:'', phone:'', email:'' }
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should not be a valid Edit Action' do 
      user = FactoryGirl.create(:user)
      get :edit, id:'', format:'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'POST' do 
    it 'should be a valid Create Action' do
      user = FactoryGirl.create(:user)
      post :create, format:'json', user:{ name:user.name , location:user.location, phone:user.phone, email:user.email }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Create Action' do 
      user = FactoryGirl.create(:user)
      post :create, format:'json', user:{ name:'' , location:'', phone:'', email:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'PUT' do 
    it 'should be a valid Update Action' do 
      user = FactoryGirl.create(:user)
      put :update, format:'json', id:user.id, user:{ name:user.name , location:user.location, phone:user.phone, email:user.email }
      response.should have_http_status(:ok)
    end
    it 'should not be a valid Update Action' do 
      user = FactoryGirl.create(:user)
      put :update, format:'json', id:user.id, user:{ name:'' , location:'', phone:'', email:'' }
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid Update Action' do 
      user = FactoryGirl.create(:user)
      put :update, format:'json', id:'', user:{ name:'' , location:'', phone:'', email:'' }
      response.should have_http_status(:unprocessable_entity)
    end
  end

  context 'DELETE' do 
    it 'should be a valid Destroy Action' do 
      user = FactoryGirl.create(:user)
      delete :destroy, format:'json', id:user.id 
      response.should have_http_status(:ok)
    end  
    it 'should not be a valid Destroy Action' do 
      user = FactoryGirl.create(:user)
      delete :destroy, format:'json', id:'hahjahka'
      response.should have_http_status(:unprocessable_entity)
    end 
    it 'should be a valid Destroy Action' do 
      user = FactoryGirl.create(:user)
      delete :destroy, format:'json', id:''
      response.should have_http_status(:unprocessable_entity)
    end 
  end
end