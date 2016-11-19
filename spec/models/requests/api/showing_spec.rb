require "rails_helper"

describe "Testing the showing api", type: :request do 
	before(:each) do
		@gallery = Profile.create(name: "Farleys", style: "Coffeeshop", profile_type: "gallery",description: "great coffeshop")
		@artist = Profile.create(name: "Pablo Picasso", style: "Cubism", profile_type: "artist",description: "great artist")		
		@photo = @artist.photos.create(price: 200, description: "Awesome painting", order:1)
		@showing = Showing.create(artist_id: @artist.id, gallery_id: @gallery.id, photo_id: @photo.id, description:"new showing")
	end
	it "GET /profiles/:profile_id/showings" do
		get "/profiles/#{@gallery.id}/showings"

		expect(response).to have_http_status(200)
	end
	it "POST /profiles/:profile_id/showings" do
		post "/profiles/#{@gallery.id}/showings", params: {
			showing: {
				artist_id: @artist.id,
				gallery_id: @gallery.id,
				photo_id: @photo.id,
				description: "new showing"
			}
		}

		expect(response).to have_http_status(201)
	end
	it "DELETE /showings/:id" do
		delete "/showings/#{@showing.id}" 

		expect(response).to have_http_status(200)
	end
end