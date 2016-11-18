require "rails_helper"

describe "Testing the profile api" do 
	it "GET /profiles should return status code 200" do 
		get "/profiles"

		expect(response).to have_http_status(200)
	end
end
