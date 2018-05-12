class ResponsesController < ApplicationController
    before_action :set_response, only: [:show, :edit, :destroy]
    before_action :authenticate_user!, only: [:show]

    def index
        @received_responses = Response.where(response_user_id: current_user.id)
        @sent_responses = Response.where(user_id: current_user.id)
    end

    def new
        @response = Response.new
        @listing = Listing.find_by(id: params[:listing_id])
        @flyer = Response.find_by(listing_id: params[:response_id])
    end

    def show

    end

    def create
        @response = Response.new(response_params)
        @response.user = current_user
        @response.response_user_id = User.find(Listing.find(params[:listing_id]).user_id).id
        @response.user_id = current_user.id
        @response.listing_id = params[:listing_id]
        
        respond_to do |format|
            if @response.save
                format.html { redirect_to @response, notice: 'Response was successfully created.' }
                format.json { render :show, status: :created, location: @response }
            else
                format.html { render :new }
                format.json { render json: @response.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @response.destroy
        respond_to do |format|
            format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
        @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
        params.require(:response).permit(:flyer_city_start_date, :flyer_city_end_date, :shopper_city_arrival_date)
    end

end
