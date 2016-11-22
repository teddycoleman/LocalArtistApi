class PhotosController < ApplicationController
	# before_action :authenticate, except: [:index, :show]

	def index
		render :json => Profile.find(params[:profile_id]).photos, status: 200
	end

	def create
		photo = Profile.find(params[:profile_id]).photos.new(photo: params[:photo])

		if photo.valid?
			photo.save
			render :json => photo, status: 201
		else
			head 400
		end
	end

	def show
		render :json => Photo.find(params[:id]), status: 200
	end

	def update
		photo = Photo.find(params[:id])
		if photo.update_attributes(photo_params)
			render :json => photo, status: 200
		else
			head 400
		end
	end

	def destroy
		photo = Photo.find(params[:id])
		photo.destroy
		render :json => photo, status: 200
	end

	private

	def photo_params
		params.require(:photo).permit(:profile_id,:price,:description,:order,:photo)
	end

end
