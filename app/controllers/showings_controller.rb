class ShowingsController < ApplicationController
	before_action :authenticate, except: [:index]

	def index
		@profile = Profile.find(params[:profile_id])
		render :json => @profile.get_showings, status: 200
	end

	def create
		showing = Showing.new(showings_params)
		if showing.valid?
			showing.save
			render :json => showing, status: 201
		else
			head 400
		end
	end

	def destroy
		showing = Showing.find(params[:id])
		showing.destroy
		render :json => showing, status: 200
	end

	private
	def showings_params
		params.require(:showing).permit(:artist_id, :gallery_id, :photo_id, :description)
	end
end
