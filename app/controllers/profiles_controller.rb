class ProfilesController < ApplicationController
    
    def show
        # unless user is signed in, 'show' redirects to root page
        redirect_to :root unless user_signed_in?
        # @profile = current_user.profile # what I thought it was (should work too)
        @profile = Profile.find(current_user.id) # alternative way you can use

        if Address.exists?(current_user.id)
            @address = Address.find(current_user.id)
        else

        end
    end

    def edit
        # if current_user.profile.exists?
        #     @profile = Profile.find(user: current_user)
        # else
        #     @profile = Profile.new
        # end

        @profile = Profile.find_or_initialize_by(user: current_user)
        @profile.user = current_user
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.user = current_user
        @profile.flyer_flytes = 0
        @profile.shopper_flytes = 0

        if @profile.save
            flash[:notice] = 'Profile created'
            redirect_to address_edit_path
        else
            flash[:alert] = 'Could not save profile'
            redirect_back(fallback_location: root_path)
        end

    end

    def update
        @profile = current_user.profile

        if @profile.update(profile_params)
            flash[:notice] = 'Profile updated'
            redirect_to profile_path
        else
            flash[:alert] = 'Could not save profile'
            redirect_back(fallback_location: root_path)
        end

    end

    def show_all
        @profile = Profile.all
    end

    private
    def profile_params
        params.require(:profile).permit([
            :first_name,
            :last_name,
            :shopper_flytes,
            :flyer_flytes,
            :avatar
        ])
    end

end
