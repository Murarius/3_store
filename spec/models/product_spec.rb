require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :price }
  it { is_expected.to respond_to :description }

  describe 'had validation of' do
    let(:product) { FactoryGirl.create(:product) }

    it 'name' do
      expect(product).to be_valid
      product.name = ''
      expect(product).not_to be_valid
    end

    it 'price' do
      product.price = ''
      expect(product).not_to be_valid
    end

    it 'description' do
      product.description = ''
      expect(product).not_to be_valid
    end
  end
end
