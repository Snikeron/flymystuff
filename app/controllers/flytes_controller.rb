class FlytesController < ApplicationController
    def new
        @flyte = Flyte.new
        @response = Response.find_by(listing_id: Listing.find(params[:listing_id]))
        @listing = Listing.find(params[:listing_id])
        
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

    def charge
        if current_user.stripe_id.blank?
          customer = Stripe::Customer.create(
            email: params[:stripeEmail],
            source: params[:stripeToken]
          )
          current_user.stripe_id = customer.id
          current_user.save!
        end
        
        charge = Stripe::Charge.create(
          customer: current_user.stripe_id,
          amount: @listing.price,
          description: @listing.item_description,
          currency: 'AUD'
        )
    
        # current_user.charges << Charge.new(charge_id: charge.id)
    
        flash[:notice] = 'Payment made!'
        redirect_back fallback_location: flytes_path
    
        rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_back fallback_location: flytes_path
      end

    private
    # Never trust parameters from the scary internet, only allow the white list through.
    def flyte_params
        params.require(:flyte).permit(:listing_id, :deposit_amount, :flyer_depart, :flyer_arrive, :handover_method, :item_received, :item_enroute, :item_arrived, :item_image_data, :item_delivered, :payment_amount)
    end

end
