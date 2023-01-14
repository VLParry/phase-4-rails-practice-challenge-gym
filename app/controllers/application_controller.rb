class ApplicationController < ActionController::API

    #make an error for all controlers
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response 

    private
#takes in an exception object
#sends back ajson object that says the error 
#can call the model on the exception object so it fills in with the model you are getting an error from 
    def render_not_found_response(exception_obj)
        render json: {error: "#{exception_obj.model} not found"}, status: :not_found 
    end
#will give us an array of strings that are the full list of error messages created by active record of what went wrong. It needs to be an array because of validations. And there are many possible reasons why it is failing 
    def render_unprocessable_entity_response(exception) 
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end 
end
