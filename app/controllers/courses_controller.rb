require 'set'

class CoursesController < ApplicationController
  # def index
  #   @courses = Course.all
  # end
  #
  # def show
  #   @course = Course.find(params[:id])
  # end
  def addcourse
    @uni = params[:uni]
  end

  def add_course
    @course = Course.create(course_params)
    @uni = params[:uni]
    if @course.valid?
      flash[:notice] = "Course added successfully."
      redirect_to course_path(@uni)
    else
      flash[:warning] = "Course add failed: " << @course.errors.full_messages.join("; ")
      render :action => 'addcourse'
    end
  end

  def course_sec
    @course_no = params[:course_no]
    @sec_no = params[:sec_no]
    @uni = params[:uni]
    @all_times = User.all_times
    @all_skills = User.all_skills
    @times_to_show = times_hash
    session['times'] = times_list

    session['skills'] = skills_list
    @skills_to_show = skills_hash
    enrolled = Course.where(course_no: @course_no, section_no: @sec_no).pluck(:uni)
    # print("This is students found in course:",course_no, " sec:", sec_no," :",enrolled)
    filtered = Array.new
    @classmates = Set.new
    # classmates = {'uni': uni, 'uname':uname, 'lionmail':lionmail, 'phone':phone, 'contact': contact, 'timeslot': timeslot, 'description':description, 'skills':skills}
    for uni in enrolled
      student_info = User.find(uni)
      if !times_list.nil?
        for t in times_list
          if student_info['time_slot'].include?(t)
            filtered.push(uni)
            break
          end
        end
      end
    end
    filtered.each do |uni|
      student_info = User.find(uni)
      if !skills_list.nil?
        for s in skills_list
          if student_info['skills'].include?(s)
            @classmates.add(student_info)
            break
          end
        end
      end
    end
    @classmates=@classmates.to_a
  end

  def course_params
    params.require(:course).permit(:course_no, :uni, :section_no)
  end

  def times_list
    if params[:times].nil?
      return User.all_times
    end
    params[:times]&.keys || session[:times] || User.all_times
  end

  def times_hash
    Hash[times_list.collect { |item| [item, "1"] }]
  end

  def skills_list
    if params[:skills].nil?
      return User.all_skills
    end
    params[:skills]&.keys || session[:skills] || User.all_skills
  end

  def skills_hash
    Hash[skills_list.collect { |item| [item, "1"] }]
  end
end
