class FlytesController < ApplicationController
    def new
        @flyte = Flyte.new
        @responses = Response.all
        @listings = Listings.all
    end

    def index
        @flytes = Flyte.all
    end

    def create
        @flyte = Flyte.new(flyte_params)
        @flyte.user = current_user
    
        respond_to do |format|
            if @flyte.save
                format.html { redirect_to @flyte, notice: 'Flyte was successfully created.' }
                format.json { render :show, status: :created, location: @flyte }
            else
                format.html { render :new }
                format.json { render json: @flyte.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def flyte_params
        params.require(:flyte).permit(:listing_id, :deposit_amount, :flyer_depart, :flyer_arrive, :handover_method, :item_received, :item_enroute, :item_arrived, :item_image_data, :item_delivered, :payment_amount)
    end
end
