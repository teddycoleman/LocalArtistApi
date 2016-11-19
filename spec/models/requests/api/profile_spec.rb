require "rails_helper"

describe "Testing the profile api", type: :request do 
	before(:each) do
		@user = User.create(first_name:"Pablo", last_name:"Picasso", email: "pp@gmail.com", password:"swordfish")
	  @profile = Profile.create(user_id: @user.id, name: "Farleys", style: "Coffeeshop", profile_type: "gallery",description: "great coffeshop")
  end

  it "GET /profiles should return a 200 status code" do
    get "/profiles"

    parsed_body = JSON.parse(response.body)
    expect(parsed_body[0]["description"]).to eq("great coffeshop")
    expect(response).to have_http_status(200)
  end

  it "POST /profiles should return a 201 status code" do
    post "/profiles", params:{
    	profile: {
        user_id: @user.id,
    		name: "Farleys",
    		style: "Coffeeshop",
    		profile_type: "gallery",
    		description: "great coffeshop"
    	}
    },
		headers: {
			"Authorization": "Token token=#{@user.auth_token}"
		}

    parsed_body = JSON.parse(response.body)
    expect(parsed_body["description"]).to eq("great coffeshop")
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
  	get "/profiles/#{@profile.id}"

    parsed_body = JSON.parse(response.body)
    expect(parsed_body["description"]).to eq("great coffeshop")
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

    parsed_body = JSON.parse(response.body)
    expect(parsed_body["description"]).to eq("REALLY great coffeshop")
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
