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

  describe 'POST /signup  #signup' do
    # it 'should call Movie.create' do
    #   expect(User).to receive(:create).with(FactoryBot.attributes_for(:user))
    # end

    context 'if password matches password_confirmation' do
      it 'should save the user into database'do
        expect {post :create, user: FactoryBot.attributes_for(:user)
        }.to change { User.count }.by(1)
      end
    end

    context 'if password does not match password_confirmation' do
      it 'should fail to save the user' do
        expect {post :create, user: FactoryBot.attributes_for(:user, password_confirmation:"1234")
        }.to change { User.count }.by(0)
      end
    end

    context 'if uni is left blank' do
      it 'should fail to save the user' do
        expect {post :create, user: FactoryBot.attributes_for(:user, uni:"")
        }.to change { User.count }.by(0)
      end
    end
  end

  describe 'POST /signin  #checkpwd' do
    # it 'should call Movie.create' do
    #   expect(User).to receive(:create).with(FactoryBot.attributes_for(:user))
    # end
    let!(:user) {FactoryBot.create(:user)}
    context 'sign in with a registered account' do
      it 'sign in successfully, should render to the course page'do
        post :checkpwd, user: FactoryBot.attributes_for(:user)
        expect(response).to redirect_to(course_path(user.id))
      end
    end

    context 'sign in with a not registered account' do
      it 'sign in unsuccessfully, should render to the signup page'do
        post :checkpwd,user: FactoryBot.attributes_for(:user, uni:"lx2301")
        expect(response).to redirect_to(signup_path())
      end
    end

    context 'sign in with a wrong password' do
      it 'sign in unsuccessfully, should render back to signin page'do
        post :checkpwd, user: FactoryBot.attributes_for(:user, password:"54321")
        expect(response).to redirect_to(signin_path())
      end
    end

  end

  describe 'GET /users/:id  #show' do
    let!(:user) {FactoryBot.create(:user)}

    it 'should find the user' do
      get :show, id: user.uni #have to id here because default routes for show is /user/:id
      expect(assigns(:user)).to eql(user)
    end

    it 'should render show page' do
      get :show, id: user.uni
      expect(response).to render_template('show')
    end
  end

  describe 'GET /course/:uni #course' do
    let!(:user) {FactoryBot.create(:user)}
    it 'should find the user' do
      get :course, uni: user.uni
      expect(assigns(:user)).to eql(user)
    end

    it 'should render course page' do
      get :course, uni: user.uni
      expect(response).to render_template('course')
    end
  end

end