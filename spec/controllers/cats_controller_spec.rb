require 'rails_helper'

describe CatsController do
	describe 'GET :index' do
		before {@cats = create_list(:cat, 2)} # needs to be an instance variable?
		it 'succeeds when json format is required' do
			get :index, format: :json
			expect(response).to be_success
			data = JSON.parse(response.body)
			expect(data.size).to eq 2
			expect(data.first['name']).to eq @cats.first.name
		end

		it 'fails when html format is required' do
			expect{get :index, format: :html}.to raise_error ActionController::UnknownFormat
		end
	end

	describe 'GET :show' do
		it 'succeeds when an existing cat id is required' do
			cat = create(:cat)
			get :show, id: cat.id, format: :json
			data = JSON.parse(response.body)
			expect(data).to have_key('name')
			expect(data['name']).to eq cat.name
		end

		it 'fails when a non existing cat id is required' do
			expect{Cat.find(1)}.to raise_error ActiveRecord::RecordNotFound
		end
	end

	describe 'POST :create' do
		before { @cat_attributes  = attributes_for(:cat) }
		it 'succeeds when all attributes are set' do
			post :create, cat: @cat_attributes, format: :json
			expect(response).to have_http_status(:created)
			data = JSON.parse(response.body)
			expect(data).to have_key('name')
			expect(data['name']).to eq @cat_attributes[:name]
		end

		it 'fails when a required field is missing' do
			@cat_attributes[:name] = nil
			post :create, cat: @cat_attributes, format: :json
			expect(response).to have_http_status(:unprocessable_entity)
		end

		it 'raises an error when params[:cat] is missing' do
			expect{ post :create, @cat_atrributes, format: :json}.to raise_error ActionController::ParameterMissing
		end
	end
		
	it 'PATCH :update' do
		cat = create(:cat)
		patch :update, id: cat.id, cat: {name: 'Jasmine'}, format: :json
		expect(response).to have_http_status(:no_content)
		expect(Cat.find(cat.id).name).to eq 'Jasmine'
	end


	it 'DELETE :destroy' do
		cat = create(:cat)
		delete :destroy, id: cat.id, format: :json
		expect(response).to have_http_status(:no_content)
		expect{Cat.find(cat.id)}.to raise_error ActiveRecord::RecordNotFound
	end
end