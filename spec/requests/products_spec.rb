require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let!(:product) { FactoryGirl.create(:product) }
  let(:valid_new_product) { { name: 'new', price: 1, description: 'new' } }
  let(:invalid_new_product) { { name: '', price: 1, description: 'new' } }

  describe 'GET /products' do
    it 'works!' do
      get '/products'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /products/id' do
    it 'works!' do
      get "/products/#{product.id}"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /products/id/edit' do
    it 'works!' do
      get "/products/#{product.id}/edit"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET /products/new' do
    it 'works!' do
      get '/products/new'
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /products' do
    it 'redirects with valid data' do
      post '/products', product: valid_new_product
      expect(response).to have_http_status(302)
      created_product = controller.product
      expect(response).to redirect_to(product_path(created_product))
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
    it 'rerenders with invalid data' do
      post '/products', product: invalid_new_product
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'PUT /products/id' do
    it 'redirects with valid data' do
      put "/products/#{product.id}", product: valid_new_product
      expect(response).to have_http_status(302)
      created_product = controller.product
      expect(response).to redirect_to(product_path(created_product))
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
    it 'rerenders with invalid data' do
      put "/products/#{product.id}", product: invalid_new_product
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE /products/id' do
    it 'works!' do
      delete "/products/#{product.id}"
      expect(response).to have_http_status(302)
    end
  end
end
