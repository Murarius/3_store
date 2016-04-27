require 'rails_helper'

# let(:user) { create :user }
# before { sign_in user }

RSpec.describe ProductsController, type: :controller do
  let!(:product) { FactoryGirl.create(:product) }
  let(:valid_new_product) { { name: 'new', price: 1, description: 'new' } }
  let(:invalid_new_product) { { name: '', price: 1, description: 'new' } }

  describe 'GET #index' do
    it 'works!' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'works!' do
      get :show, id: product.id
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'works!' do
      get :edit, id: product.id
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET #new' do
    it 'works!' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'success' do
      it 'redirects with valid data' do
        post :create, product: valid_new_product
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(controller.product)
      end

      it 'flashes info' do
        post :create, product: valid_new_product
        expect(flash[:success]).to eq 'Product was successfully created.'
      end

      it 'creates' do
        expect { post :create, product: valid_new_product }.to change(Product, :count).by(1)
      end
    end

    context 'failure' do
      it 'rerenders' do
        post :create, product: invalid_new_product
        expect(response).to have_http_status(200)
        expect(response).to render_template(:new)
      end

      it 'dont create' do
        expect { post :create, product: invalid_new_product }.to change(Product, :count).by(0)
      end

      render_views
      it 'displays errors' do
        post :create, product: invalid_new_product
        controller.product.errors.each do |_label, error|
          expect(response.body).to have_content(error)
        end
      end
    end
  end

  describe 'PUT #update' do
    context 'success' do
      it 'redirects with valid data' do
        put :update, id: product.id, product: valid_new_product
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(controller.product)
      end

      it 'flashes info' do
        put :update, id: product.id, product: valid_new_product
        expect(flash[:success]).to eq 'Product was successfully updated.'
      end

      it 'updates' do
        put :update, id: product.id, product: valid_new_product
        expect(product.reload.name).to eq valid_new_product[:name]
      end
    end

    context 'failure' do
      it 'rerenders' do
        put :update, id: product.id, product: invalid_new_product
        expect(response).to have_http_status(200)
        expect(response).to render_template(:edit)
      end

      it 'dont update' do
        put :update, id: product.id, product: invalid_new_product
        expect(product.reload.name).not_to eq invalid_new_product[:name]
      end

      render_views
      it 'displays errors' do
        put :update, id: product.id, product: invalid_new_product
        controller.product.errors.each do |_label, error|
          expect(response.body).to have_content(error)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'works!' do
      delete :destroy, id: product.id
      expect(response).to have_http_status(302)
    end
  end
end
