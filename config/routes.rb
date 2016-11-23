Rails.application.routes.draw do
  
  devise_for :users
	resources :profiles, except: [:edit, :new] do
		resources :photos, except: [:edit, :new]
	end

	get "/photos", to: "photos#all_photos"

	get "/profiles/:profile_id/showings", to: "showings#index"
	post "/profiles/:profile_id/showings", to: "showings#create"
	delete "/showings/:id", to: "showings#destroy"

end
