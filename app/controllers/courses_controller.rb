class CoursesController < ApplicationController
  # def index
  #   @courses = Course.all
  # end
  #
  # def show
  #   @course = Course.find(params[:id])
  # end
  def add_course
    @course = Course.create(uni: params[:uni], course_no: params[:course_no], section_no: params[:section_no])
    if @course.valid?
      flash[:notice] = "Course added successfully."
      redirect_to course_path(params[:uni])
    else
      flash[:warning] = "Course add failed: "<< @course.errors.full_messages.join("; ")
      redirect_to course_path(params[:uni])
    end
  end
  def course_params
    params.require(:course).permit(:course_no, :uni, :section_no)
  end
end
