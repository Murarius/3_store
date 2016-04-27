require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }

  describe 'had validation of' do
    let(:user) { FactoryGirl.create(:user) }

    it 'email' do
      expect(user).to be_valid
      user.email = ''
      expect(user).not_to be_valid
    end

    it 'password' do
      user.password = ''
      expect(user).not_to be_valid
    end
  end
end
