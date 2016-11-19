require "rails_helper"

describe "Testing the showing api", type: :request do 
	before(:each) do
		@pablo = User.create(first_name:"Pablo", last_name:"Picasso", email: "pp@gmail.com", password:"swordfish")	
		@owner = User.create(first_name:"Matt", last_name:"Foley", email: "mfoley@gmail.com", password:"swordfish")	
		@gallery = Profile.create(user_id: @owner.id, name: "Farleys", style: "Coffeeshop", profile_type: "gallery",description: "great coffeshop")
		@artist = Profile.create(user_id: @pablo.id, name: "Pablo Picasso", style: "Cubism", profile_type: "artist",description: "great artist")		
		@photo = @artist.photos.create(price: 200, description: "Awesome painting", order:1)
		@showing = Showing.create(artist_id: @artist.id, gallery_id: @gallery.id, photo_id: @photo.id, description:"new showing")
	end
	it "GET /profiles/:profile_id/showings" do
		get "/profiles/#{@gallery.id}/showings"

    parsed_body = JSON.parse(response.body)
    expect(parsed_body[0]["description"]).to eq("new showing")
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
		},
		headers: {
			"Authorization": "Token token=#{@pablo.auth_token}"
		}

    parsed_body = JSON.parse(response.body)
    expect(parsed_body["description"]).to eq("new showing")
		expect(response).to have_http_status(201)
	end
	it "DELETE /showings/:id" do
		delete "/showings/#{@showing.id}",
		headers: {
			"Authorization": "Token token=#{@pablo.auth_token}"
		}

		expect(response).to have_http_status(200)
	end
end