class ProfilesController < ApplicationController
	before_action :authenticate, except: [:index, :show]

	def index
		@profiles = Profile.all
		render :json => @profiles.map {|profile| [profile, profile.profile_pic.url]}, status: 200
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
		profile_array = [profile, profile.profile_pic.url]
		render :json => profile_array, status: 200
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
		params.require(:profile).permit(:name, :style, :profile_type, :description, :profile_pic, :user_id)
	end
end
