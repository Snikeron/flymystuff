class AddressesController < ApplicationController

    # def show
    #     # unless user is signed in, 'show' redirects to root page
    #     redirect_to :root unless user_signed_in?
    #         # @address = current_user.address # what I thought it was (should work too)
    #         @address = Address.find(current_user.id) # alternative way you can use
    # end

    def edit
        # if current_user.address.exists?
        #     @address = address.find(user: current_user)
        # else
        #     @address = address.new
        # end

        @address = Address.find_or_initialize_by(user: current_user)
        @address.user = current_user
    end

    def create
        @address = Address.new(address_params)
        @address.user = current_user

        if @address.save
            flash[:notice] = 'address created'
            redirect_to root_path
        else
            flash[:alert] = 'Could not save address'
            redirect_back
        end

    end

    def update
        @address = current_user.address

        if @address.update(address_params)
            flash[:notice] = 'address updated'
            redirect_to profile_path
        else
            flash[:alert] = 'Could not save address'
            redirect_back
        end

    end

    private
    # A 'Dry' way to set the address as a method to be called above --> "address.find(set_address)" instead of "address.find(user: current_user)"
    # 
    # def set_address
    #     {user: current_user}
    # end

    # Gets form address and fills in the fields.
    def address_params
        params.require(:address).permit([
            :street_address,
            :city,
            :state,
            :postcode,
            :country_code
        ])
    end

end
