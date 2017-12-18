require 'rails_helper'

describe UsersController do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new user to the database' do
        expect{
          post :create, user: { name: 'Testing' }
        }.to change { User.count }.by(1)
      end

      it 'redirects to the root page' do
        expect(
          post :create, user: { name: 'Testing' }
        ).to redirect_to(root_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not increase user if name is empty' do
        expect{
          post :create, user: { name: '' }
        }.to change { User.count }.by(0)
      end

      it 'redirects to the root page' do
        expect(
          post :create, user: { name: '' }
        ).to redirect_to(root_path)
      end
    end
  end
end