require "rails_helper"

describe "Testing the profile api", type: :request do 
	before(:each) do
		@user = User.create(first_name:"Pablo", last_name:"Picasso", email: "pp@gmail.com", password:"swordfish")
	end

  it "GET /profiles should return a 200 status code" do
    get "/profiles"

    expect(response).to have_http_status(200)
  end

  it "POST /profiles should return a 201 status code" do
    post "/profiles", params:{
    	profile: {
    		name: "Farleys",
    		style: "Coffeeshop",
    		profile_type: "gallery",
    		description: "great coffeshop"
    	}
    },
		headers: {
			"Authorization": "Token token=#{@user.auth_token}"
		}

    expect(response).to have_http_status(201)
  end

  it "POST /profiles should return a 400 status code if attribute missing" do
    post "/profiles", params:{
    	profile: {
    		name: "Farleys",
    		description: "great coffeshop"
    	}
    },
		headers: {
			"Authorization": "Token token=#{@user.auth_token}"
		}

    expect(response).to have_http_status(400)
  end

  it "GET /profiles/:id should return a 200 status code" do
  	profile = Profile.create(name: "Farleys", style: "Coffeeshop", profile_type: "gallery",description: "great coffeshop")
    get "/profiles/#{profile.id}"

    expect(response).to have_http_status(200)
  end

  it "PUT /profiles/:id should return a 200 status code" do
  	profile = Profile.create(name: "Farleys", style: "Coffeeshop", profile_type: "gallery",description: "great coffeshop")
    put "/profiles/#{profile.id}", params:{
    	profile: {
    		description: "REALLY great coffeshop"
    	}
    },
		headers: {
			"Authorization": "Token token=#{@user.auth_token}"
		}

    expect(response).to have_http_status(200)
  end

  it "delete /profiles/:id should return a 200 status code" do
  	profile = Profile.create(name: "Farleys", style: "Coffeeshop", profile_type: "gallery",description: "great coffeshop")
    delete "/profiles/#{profile.id}",
		headers: {
			"Authorization": "Token token=#{@user.auth_token}"
		}

    expect(response).to have_http_status(200)
  end

end
