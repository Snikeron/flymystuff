class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:index, :show, :new, :create]

    def index
        @listings = Listing.all
    end

    def user_index
        @listings = Listing.where(user_id: current_user.id)
    end

    def show
    end

    def new
        @listing = Listing.new
    end

    def create
        @listing = Listing.new(listing_params)
        @listing.user = current_user
    
        respond_to do |format|
            if @listing.save
                format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
                format.json { render :show, status: :created, location: @listing }
            else
                format.html { render :new }
                format.json { render json: @listing.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
        @listing = Listing.find_or_initialize_by(user: current_user)
        @listing.user = current_user
    end

    def update
        respond_to do |format|
            if @listing.update(listing_params)
            format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
            format.json { render :show, status: :ok, location: @listing }
            else
            format.html { render :edit }
            format.json { render json: @listing.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
    @listing.destroy
        respond_to do |format|
            format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:shopper_city, :flyer_city, :item_description, :price, :item_photo)
    end
end
