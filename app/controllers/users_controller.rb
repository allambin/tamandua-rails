class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def create
    user = UserService.create_user(user_params)
    render json: user, status: :created
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # GET /users
  def index
    users = User.all
    render json: users, adapter: :json, each_serializer: UserSerializer
  end

  # GET /users/1
  def show
    render json: @user
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :email, :password ])
    end
end
