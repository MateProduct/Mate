class UsersController < ApplicationController

  def show
    uni = params[:id] # retrieve user ID(uni) from URI route
    @user = User.find(uni) # look up user by unique ID
    # # will render app/views/users/show.<extension> by default
  end

  def index
    #@uni = session[:uni]
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
          if @user.email_confirmed
            session[:uni]= uni
            redirect_to course_path(uni)
          else
            flash[:notice] = "Please activate your account by following the instructions in the account confirmation email you received to proceed."
            redirect_to signin_path
          end
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

  def confirm_email
    @user = User.find_by_confirm_token(params[:confirm_token])
    if @user != nil
      attributes = {}
      attributes[:email_confirmed] = true
      attributes[:confirm_token] = nil
      @user.update_attributes!(attributes)
      flash[:notice] = "Welcome to the Mate App! Your email has been confirmed. Please sign in to continue."
      redirect_to signin_path
    else
      flash[:notice] = "Sorry. The token has been used or does not exist. Please log in using your account info."
      redirect_to users_path
    end
  end

  def create#_user
    # @user = Users.create!(user_params)
    # if User.exists?(uni:params[:user][:uni])
    #   flash[:warning] = "Account creation failed. Please check if UNI is already registered."
    #   render :action => 'signup'
    # end
    @user = User.create(create_user_params.merge(lionmail: create_user_params[:uni]+'@columbia.edu', skills:"", time_slot:"")) #Ref: https://stackoverflow.com/questions/23975835/ruby-on-rails-active-record-return-value-when-create-fails
    if @user.valid?
      UserMailer.registration_confirmation(@user).deliver_now
      flash[:notice] = "#{@user.uni} was successfully created. Please confirm your email."
      redirect_to signin_path
    else
      #print("Error in create",@user.error.full_messages) #Ref:https://coursehunters.online/t/pragmaticstudio-ruby-on-rails-6-part-6/4449
      flash[:warning] = "Account creation failed: "<< @user.errors.full_messages.join("; ")
      render :action => 'signup'
    end

  end

  def edit
    # @user = User.find params[:uni]
    #@uni = params[:uni]
  end
  def profile
    @all_times = User.all_times
    @all_skills = User.all_skills
    @user = User.find params[:uni]
    @uni = params[:uni]
    @times_to_show = @user.time_slot
    @skills_to_show = @user.skills
  end
  def update
    @uni = params[:uni]
    @user = User.find params[:uni]
    @user.update_attributes!(update_params.merge(time_slot: times_list, skills: skills_list))
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
    params.require(:user).permit(:uni, :uname, :lionmail, :phone, :contact, :description)
  end

  def create_user_params
    params.require(:user).permit(:uni, :password, :password_confirmation,:uname)
  end

  def times_list
    if params[:times].nil?
      return ""
    end
    params[:times]&.keys
  end

  # def times_hash
  #   if times_list.empty?
  #     return ""
  #   end
  #   Hash[times_list.collect { |item| [item, "1"] }]
  # end

  def skills_list
    if params[:skills].nil?
      return ""
    end
    params[:skills]&.keys
  end

  # def skills_hash
  #   if skills_list.empty?
  #     return ""
  #   end
  #   Hash[skills_list.collect { |item| [item, "1"] }]
  # end

end
