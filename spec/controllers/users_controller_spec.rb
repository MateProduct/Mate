require 'rails_helper'

describe UsersController do

  describe 'PUT #update' do
    let!(:user1) {FactoryBot.create(:user)}
    before(:each) do
      put :update, uni: user1.uni, user: FactoryBot.attributes_for(:user, time_slot: 'Tuesday')
    end

    it 'updates an existing user' do
      user1.reload
      expect(user1.time_slot).to eql('Tuesday')
    end

    it 'redirects to the course page' do
      expect(response).to redirect_to(course_path(user1))
    end
  end
end