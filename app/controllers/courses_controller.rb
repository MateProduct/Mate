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
    course_params[:uni] = params[:uni]
    @course = Course.create( course_params)
    if @course.valid?
      flash[:notice] = "Course added successfully."
      redirect_to course_path(params[:uni])
    else
      flash[:warning] = "Course add failed: "<< @course.errors.full_messages.join("; ")
      render :action => 'addcourse'
    end
  end
  def course_params
    params.require(:course).permit(:course_no, :uni, :section_no)
  end
end
