require "rails_helper"

describe "Testing the photo api", type: :request do 

	before(:each) do
		@user = User.create(first_name:"Pablo", last_name:"Picasso", email: "pp@gmail.com", password:"swordfish")	
		@profile = Profile.create(user_id: @user.id, name: "Farleys", style: "Coffeeshop", profile_type: "gallery",description: "great coffeshop")	
		@photo = @profile.photos.create(price: 200, description: "Awesome painting", order:1)
	end

	it "GET /profiles/:id/photos returns a status code of 200" do
		get "/profiles/#{@profile.id}/photos"

		parsed_body = JSON.parse(response.body)
		expect(parsed_body[0]["description"]).to eq("Awesome painting")
		expect(response).to have_http_status(200)
	end

	it "POST /profiles/:profile_id/photos returns a status code of 201" do
		post "/profiles/#{@profile.id}/photos",params: {
			photo: {
				profile_id: @profile.id,
				price: 200,
				description: "Awesome painting",
				order: 1
			}
		},
		headers: {
			"Authorization": "Token token=#{@user.auth_token}"
		}

		parsed_body = JSON.parse(response.body)
		expect(parsed_body["description"]).to eq("Awesome painting")
		expect(response).to have_http_status(201)
	end

	it "GET /profiles/:profile_id/photos/:id should return 200 status code" do
		get "/profiles/#{@profile.id}/photos/#{@photo.id}"

		parsed_body = JSON.parse(response.body)
		expect(parsed_body["description"]).to eq("Awesome painting")
		expect(response).to have_http_status(200)
	end

	it "PUT /profiles/:profile_id/photos/:id should return 200 status code" do
		put "/profiles/#{@profile.id}/photos/#{@photo.id}", params: {
			photo: {
				description: "REALLY awesome painting"
			}
		},
		headers: {
			"Authorization": "Token token=#{@user.auth_token}"
		}

		parsed_body = JSON.parse(response.body)
		expect(parsed_body["description"]).to eq("REALLY awesome painting")
		expect(response).to have_http_status(200)
	end

  it "delete /profiles/:profile_id/photos/:id should return a 200 status code" do
  	photo = @profile.photos.create(price: 200, description: "Awesome painting", order:1)
    delete "/profiles/#{@profile.id}/photos/#{photo.id}",
		headers: {
			"Authorization": "Token token=#{@user.auth_token}"
		}

    expect(response).to have_http_status(200)
  end
  
end
