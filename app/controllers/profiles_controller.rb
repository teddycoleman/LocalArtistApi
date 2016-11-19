class ProfilesController < ApplicationController
	def index
		render :json => Profile.all, status: 200
	end

	def create
		profile = Profile.new(profile_params)

		if profile.valid?
			profile.save
			render :json => profile, status: 201
		else
			head 400
		end
	end

	def show
		profile = Profile.find(params[:id])
		render :json => profile, status: 200
	end

	def update
		profile = Profile.find(params[:id])

		if profile.update_attributes(profile_params)
			render :json => profile, status: 200
		else
			head 400
		end
	end

	def destroy
		profile = Profile.find(params[:id])
		profile.destroy
		render :json => profile, status: 200
	end

	private
	def profile_params
		params.require(:profile).permit(:name, :style, :profile_type, :description)
	end
end
