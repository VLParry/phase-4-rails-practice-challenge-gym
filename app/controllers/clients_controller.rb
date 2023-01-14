class ClientsController < ApplicationController

    before_action :find_client, only: [:show, :update]
    
    #its first looking to see if there is a serializer for the model of this instance of a client (an object) but here we are passing it the other TotalMembershipSerializer 
    def show
        render json: @client, serializer: TotalMembershipsSerializer 
    end

    def update
    
    end

    private

    def find_client
        @client = Client.find(params[:id])
    end
end
