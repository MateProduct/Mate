class UsersController < ApplicationController

  def show
    uni = params[:id] # retrieve user ID(uni) from URI route
    @user = User.find(uni) # look up user by unique ID
    # # will render app/views/users/show.<extension> by default
  end

  def index

  end

  def new
    # default: render 'new' template
  end

  def signup

  end

  def signin

  end
  def checkpwd
    uni = user_params[:uni]
    password = user_params[:password]
    if uni == ""
      flash[:warning] = "Please enter UNI."
      redirect_to signin_path
    elsif password == ""
      flash[:warning] = "Please enter password."
      redirect_to signin_path
    else
      @user = User.find_by(uni: uni)
      if @user != nil
        if password == @user.password
            redirect_to course_path(uni)
        else
          flash[:notice] = "Invalid password. Please try again."
          redirect_to signin_path
        end
      else
        flash[:notice] = "#{uni} hasn't been signup. Please signup first"
          redirect_to signup_path
      end

    end
  end

  def create#_user
    # @user = Users.create!(user_params)
    # if User.exists?(uni:params[:user][:uni])
    #   flash[:warning] = "Account creation failed. Please check if UNI is already registered."
    #   render :action => 'signup'
    # end
    @user = User.create(create_user_params) #Ref: https://stackoverflow.com/questions/23975835/ruby-on-rails-active-record-return-value-when-create-fails
    if @user.valid?
      flash[:notice] = "#{@user.uni} was successfully created."
      redirect_to signin_path
    else
      #print("Error in create",@user.error.full_messages) #Ref:https://coursehunters.online/t/pragmaticstudio-ruby-on-rails-6-part-6/4449
      flash[:warning] = "Account creation failed: "<< @user.errors.full_messages.join("; ")
      render :action => 'signup'
    end

  end

  def edit
    # @user = User.find params[:uni]
  end
  def profile
    @all_times = User.all_times
    @all_skills = User.all_skills
    @user = User.find params[:uni]
  end
  def update
    @user = User.find params[:uni]
    @user.update_attributes!(update_params)
    flash[:notice] = "#{@user.uni} was successfully updated."
    redirect_to course_path(@user)
  end

  def course
    @user = User.find params[:uni]
    @uni = params[:uni]
    session[:uni] = @uni
    courses= Course.where(uni:@uni).pluck(:course_no, :section_no)
    @course_list=[]
    courses.each { |course_no, section_no|
      course_info = { 'course_no' => course_no, 'section_no' => section_no }
      @course_list.append(course_info)
    }
  end

  def destroy
    # @movie = Movie.find(params[:id])
    # @movie.destroy
    # flash[:notice] = "Movie '#{@movie.title}' deleted."
    # redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def user_params
    params.require(:user).permit(:uni, :password)
  end

  def update_params
    params.require(:user).permit(:uni, :uname, :lionmail, :phone, :contact, {time_slot:[]}, :description, {skills:[]})
  end

  def create_user_params
    params.require(:user).permit(:uni, :password, :password_confirmation,:uname)
  end

end
