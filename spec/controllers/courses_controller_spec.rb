require 'rails_helper'

describe CoursesController do
  describe 'POST /add_course/:uni  #add_course' do
    # let!(:course) {FactoryBot.create(:course)}
    context 'add a course successfully' do
      it 'should save the course into database'do
        expect {post :add_course, course: FactoryBot.attributes_for(:course)
        }.to change { Course.count }.by(1)
      end
    end

    # context 'add a course successfully' do
    #   it 'should save the course into database'do
    #     expect {post :add_course, course: FactoryBot.attributes_for(:course)
    #     }.to change { Course.count }.by(0)
    #   end
    # end
    #
  end


end