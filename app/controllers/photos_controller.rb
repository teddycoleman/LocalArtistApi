class PhotosController < ApplicationController
	before_action :authenticate, except: [:index, :show, :all_photos]

	def index
		@photos = Profile.find(params[:profile_id]).photos
		render :json => @photos.map {|photo| [photo.attributes, photo.photo_url]}, status: 200
	end

	def all_photos
		@photos = Photo.all
		render :json =>  @photos.map {|photo| [photo.attributes, photo.photo_url]}, status: 200
	end

	def create
		photo = Profile.find(params[:profile_id]).photos.new(photo: params[:photo])

		if photo.valid?
			photo.save
			render :json => [photo, photo.photo_url], status: 201
		else
			head 400
		end
	end

	def show
		@photo = Photo.find(params[:id])
		render :json => @photo.to_json(:only => [:profile_id,:price,:description,:order,:showing_id], :methods => [:photo_url]), status: 200
	end

	def edit
		p params
		p photo_params
		@photo = Photo.find(params[:id])
		@photo.update_attributes(photo_params)
		render :json => @photo.to_json(:only => [:profile_id,:price,:description,:order,:showing_id], :methods => [:photo_url]), status: 200
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
		params.require(:photo).permit(:profile_id,:price,:description,:order,:photo,:showing_id)
	end

end
