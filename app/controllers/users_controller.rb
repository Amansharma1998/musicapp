class UsersController < ApplicationController
  before_action :find_user, except: %i[create index]
  skip_before_action :authenticate_user, only: [:create]
  
  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/{username}
  def show
    render json: @user
  end

   # POST /users
   def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      render json: { message: "User Created", data: @user }
    else
      render json: { errors: @user.errors.full_messages },status: :unprocessable_entity
             
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

   # DELETE /users/{username}
   def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by_username!(params[:username])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:username, :email, :password, :user_type)
  end
end
