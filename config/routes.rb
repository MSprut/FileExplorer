Rails.application.routes.draw do

  resources :folders
  resources :asset_files
  devise_for :users
  
	root :to => "home#index"

	get "uploads/get/:id", to: "asset_files#get", as: "download"
	get "browse/:folder_id", to: "home#browse", as: "browse"
	get "browse/:folder_id/new_folder", to: "folders#new", as: "new_sub_folder"
	get "browse/:folder_id/new_file", to: "asset_files#new", as: "new_sub_file"
	get "browse/:folder_id/rename", to: "folders#edit", as: "rename_folder"
  get "destroy_multiple", to: "home#destroy_multiple", as: "remove_all"

  namespace :api do
    namespace :v1 do
      resources :asset_files
      resources :folders
      resources :home
      get "uploads/get/:id", to: "asset_files#get", as: "download"
      get "browse/:folder_id", to: "home#browse", as: "browse"
      post "new_folder", to: "folders#create"#, as: "new_folder"
    end
  end
end
