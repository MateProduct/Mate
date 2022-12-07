require 'rails_helper'

describe CoursesController do
  describe 'POST /add_course/:uni  #add_course' do
    let!(:course1) {FactoryBot.create(:course)}
    context 'add a course successfully' do
      it 'should save the course into database'do
        expect {post :add_course, uni:course1.uni, course: FactoryBot.attributes_for(:course, course_no: "COMSE6156", section_no: "001")
        }.to change { Course.count }.by(1)
      end
    end

    context 'add a course with a course_no that already exists' do
      it 'should fail to save the course' do
        post :add_course, uni:course1.uni, course: FactoryBot.attributes_for(:course, course_no: "COMSE6156", section_no: "001")
        expect {post :add_course, uni:course1.uni, course: FactoryBot.attributes_for(:course, course_no: "COMSE6156", section_no: "001")
        }.to change { Course.count }.by(0)
      end
    end
  end

  describe 'GET /course_sec/:course_no/:sec_no #course_src' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:course) {FactoryBot.create(:course)}
    it 'should show the users who have enrolled in the same section' do
      get :course_sec, course_no: course.course_no, sec_no: course.section_no, uni:user.uni
      expect(response).to include {FactoryBot.attributes_for(:user, uni: "aa1001")}
    end
  end

  describe 'GET /course_sec/:course_no/:sec_no #course_src' do
    let!(:user) {FactoryBot.create(:user)}
    let!(:course) {FactoryBot.create(:course)}
    let!(:user1) {FactoryBot.create(:user, uni: "es1000")}
    let!(:user2) {FactoryBot.create(:user, uni: "jc5897")}
    let!(:user3) {FactoryBot.create(:user, uni: "aa1001")}
    it 'should show the users who have enrolled in the same section' do
      get :course_sec, course_no: course.course_no, sec_no: course.section_no, uni:user.uni
      expect(assigns(:classmates)).to include {[user1]}
    end
    it 'should show the users who have enrolled with the specific time_slot selected' do
      get :course_sec, course_no: course.course_no, sec_no: course.section_no, uni:user.uni, times: { "Mon Morning":1 }
      expect(assigns(:classmates)).to include {[user1]}

    end

    it 'should show the users who have enrolled with the specific time_slot selected' do
      get :course_sec, course_no: course.course_no, sec_no: course.section_no, uni:user.uni, times: { "Tues Morning":1 }
      expect(assigns(:classmates)).to include {[user2]}

    end

    it 'should show the users who have enrolled with the specific skills selected' do
      get :course_sec, course_no: course.course_no, sec_no: course.section_no, uni:user.uni, skills: { "Java":1 }
      expect(assigns(:classmates)).to include {[user3]}

    end
  end


end