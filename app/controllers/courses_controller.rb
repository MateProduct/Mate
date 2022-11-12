class CoursesController < ApplicationController
  # def index
  #   @courses = Course.all
  # end
  #
  # def show
  #   @course = Course.find(params[:id])
  # end
  def  addcourse
  end

  def add_course
    @course = Course.create( course_params)
    if @course.valid?
      flash[:notice] = "Course added successfully."
      redirect_to course_path(params[:uni])
    else
      flash[:warning] = "Course add failed: "<< @course.errors.full_messages.join("; ")
      render :action => 'addcourse'
    end
  end

  def course_sec
    @course_no = params[:course]
    @sec_no = params[:sec]
    @uni = session[:uni]
    enrolled= Course.where(course_no:@course_no, section_no:@sec_no).pluck(:uni)
    # print("This is students found in course:",course_no, " sec:", sec_no," :",enrolled)
    @classmates=[]
    # classmates = {'uni': uni, 'uname':uname, 'lionmail':lionmail, 'phone':phone, 'contact': contact, 'timeslot': timeslot, 'description':description, 'skills':skills}
    for uni in enrolled
      student_info = User.find(uni)
      # print("student info:", student_info.inspect)
      # info_hash = {'uni'=>student_info['uni'], 'uname'=>student_info['uname'],'lionmail'=>student_info['lionmail'], 'phone'=>student_info['phone'], 'contact'=>student_info['contact'], 'time_slot'=>student_info['time_slot'], 'description'=>student_info['description'], 'skills'=>student_info['skills'] }
      # print("info hash:", info_hash)
      @classmates.append(student_info)
      end
  end

  def course_params
    params.require(:course).permit(:course_no, :uni, :section_no)
  end
end
