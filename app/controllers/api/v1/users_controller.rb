class Api::V1::UsersController < ApplicationController
    # ip_before_action :authenticate_request, only: [:create,]
    before_action :set_user, only: [:show, :update, :destroy]

    def index
        @users = User.all
        render json: @users
    end
    
    def show
        render json: @user.data
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user.data, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            # render json: {messages:'User successfully updated' }, status:200
            render json: @user.data
        else
            # render error: {error:'Unable to update User.'}, status:400
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render json:{messages:'User successfully deleted' }, status:200
        else
            render error:{error:'Unable to delete User.'}, status:400
        end
    end

    private
        def set_user
            @user = User.find_by_id(params[:id])
            # return render json: @userz
            if @user.nil?
                return render json: { error: "User not found"}, status: 404
            end
        end

        def user_params
            {
                name:params[:name],
                email:params[:email],
                password:params[:password],
                company:params[:company],
                address:params[:address],
                role:params[:role],
                cv:params[:cv]
              }
            # params.require(:user).permit(:name, :email, :password, :company, :address, :role, :cv)
        end
end
