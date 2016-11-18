Rails.application.routes.draw do
  
	resources :profiles, except: [:edit, :new] do
		resources :photos, except: [:edit, :new]
	end

	get "profiles/:profile_id/showings", to: "showings#index"
	post "profiles/:profile_id/showings", to: "showings#create"
	delete "/showings/:id", to: "showings#destroy"

end
