class GymsController < ApplicationController
    #when an action gets called on the gym controler, first run find gym 
    before_action :find_gym, only: [:show, :destroy, :update]

    def index
        render json: Gym.all
    end

    def show
        render json: @gym 
    end

    #the !bang here handles any problemds when updating a gym
    def update
        @gym.update!(gym_params)
        render json: @gym 
    end

    def destroy 
        @gym.destroy
        head :no_content 
    end

    private
    #to make it accessible to other methods in the class it needs to be an instance variable (@)
    def gym_params
        params.permit(:name, :address)
    end
    
    def find_gym
        @gym = Gym.find(params[:id])
    end
end
