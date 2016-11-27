Rails.application.routes.draw do
  
  devise_for :users
	resources :profiles, except: [:edit, :new] do
		resources :photos, except: [:edit, :new]
	end

	get "/photos", to: "photos#all_photos"
	put "/photos/:id", to: "photos#edit"
	
	get "/profiles/:profile_id/showings", to: "showings#index"
	get "/showings", to: "showings#all_showings"
	get "/showings/:id", to: "showings#show"
	post "/profiles/:profile_id/showings", to: "showings#create"
	delete "/showings/:id", to: "showings#destroy"

end
