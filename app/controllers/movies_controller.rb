class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @movies = Movie.all
  end

  def new
    # default: render 'new' template
  end

  def signup

  end

  def signin
    print("signin")
    #uni = user_params[:uni]
    # password = user_params[:password]
    # @user = User.find(uni)
    # if @user
    #   if password == @user.password
    #
    #   end
    # else
    #
    # end
  end
  def checkpwd
    uni = user_params[:uni]
    password = user_params[:password]

    @user = User.find(uni)
    if @user.valid?
      if password == @user.password
          redirect_to profile_path(@user)
      else
        flash[:notice] = "Invalid password. Please try again."
        redirect_to signin_path
      end
    else
      flash[:notice] = "#{uni} hasn't been signup. Please signup first"
        redirect_to signup_path
    end
    # if @user
    #   if password == @user.password
    #
    #   end
    # else
    #
    # end
  end

  def create#_user
    # @user = Users.create!(user_params)
    @user = User.create(user_params) #Ref: https://stackoverflow.com/questions/23975835/ruby-on-rails-active-record-return-value-when-create-fails
    if @user.valid?
      flash[:notice] = "#{@user.uni} was successfully created."
      redirect_to signin_path
    else
      flash[:warning] = "Account creation failed. Please check if UNI is already registered."
      render :action => 'signup'
    end

  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def user_params
    params.require(:user).permit(:uni, :password, :uname, :lionmail, :phone, :contact, :time_slot, :description, :skills)
  end

end
