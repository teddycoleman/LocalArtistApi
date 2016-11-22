class ShowingsController < ApplicationController
	before_action :authenticate, except: [:index]

	def index
		@profile = Profile.find(params[:profile_id])
		showings_info = {}
		@showings = @profile.get_showings
		@showings.each do |showing|
			showings_info[showing.id] = {
				:showing => showing, 
				:artist => showing.artist,
				:gallery => showing.gallery,
				:photo => [showing.photo, showing.photo.photo_url] 
			}
		end
		render :json => showings_info, status: 200
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
