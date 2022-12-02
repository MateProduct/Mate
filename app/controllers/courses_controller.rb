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
  end

  def add_course
    @course = Course.create(course_params)
    if @course.valid?
      flash[:notice] = "Course added successfully."
      redirect_to course_path(params[:uni])
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
    @classmates = Set.new
    # classmates = {'uni': uni, 'uname':uname, 'lionmail':lionmail, 'phone':phone, 'contact': contact, 'timeslot': timeslot, 'description':description, 'skills':skills}

    for uni in enrolled
      student_info = User.find(uni)
      # print("student info:", student_info.inspect)
      # info_hash = {'uni'=>student_info['uni'], 'uname'=>student_info['uname'],'lionmail'=>student_info['lionmail'], 'phone'=>student_info['phone'], 'contact'=>student_info['contact'], 'time_slot'=>student_info['time_slot'], 'description'=>student_info['description'], 'skills'=>student_info['skills'] }
      # print("info hash:", info_hash)
      if times_list.nil? && skills_list.nil?
        p("\n both time_slot and skills are nil")
        @classmates.add(student_info)
      elsif times_list.nil? && !skills_list.nil?
        p("\n time_slot is nil & skills not nil")
        for s in skills_list
          if student_info['skills'].include?(s)
            @classmates.add(student_info)
            break
          end
        end
      elsif !times_list.nil? && skills_list.nil?
        for t in times_list
          if student_info['time_slot'].include?(t)
            @classmates.add(student_info)
            break
          end
        end
      else
        for t in times_list
          if student_info['time_slot'].include?(t)
            @classmates.add(student_info)
            break
          end
        end
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
    params[:times]&.keys || session[:times] || User.all_times
  end

  def times_hash
    Hash[times_list.collect { |item| [item, "1"] }]
  end

  def skills_list
    params[:skills]&.keys || session[:skills] || User.all_skills
  end

  def skills_hash
    Hash[skills_list.collect { |item| [item, "1"] }]
  end
end
