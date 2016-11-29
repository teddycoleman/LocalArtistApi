class ShowingsController < ApplicationController
	before_action :authenticate, except: [:index, :all_showings, :show]

	def index
		@profile = Profile.find(params[:profile_id])
		showings_info = {}
		@showings = @profile.get_showings
		@showings.each do |showing|
			showings_info[showing.id] = {
				:showing => showing, 
				:artist => showing.artist,
				:gallery => showing.gallery,
				:photo => [showing.photos[0], showing.photos[0].photo_url],
				:profile_pic => showing.artist.profile_pic.url 
			}
		end
		render :json => showings_info, status: 200
	end

	def all_showings
		@showings = Showing.all
		showings_info = {}
		@showings.each do |showing|
			showings_info[showing.id] = {
				:showing => showing, 
				:artist => showing.artist,
				:gallery => showing.gallery,
				:photo => [showing.photos[0], showing.photos[0].photo_url],
				:profile_pic => showing.artist.profile_pic.url 
			}
		end
		render :json => showings_info, status: 200
	end

	def show
		showing = Showing.find(params[:id])
		showing_info = {
			:showing => showing, 
			:artist => showing.artist,
			:gallery => showing.gallery,
			:photos => showing.photos.map {|photo| [photo, photo.photo_url] },
			:artist_pic => showing.artist.profile_pic.url,
			:gallery_pic => showing.gallery.profile_pic.url
		}
		render :json => showing_info, status: 200
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
		params.require(:showing).permit(:artist_id, :gallery_id, :description, :photo_id)
	end
end
