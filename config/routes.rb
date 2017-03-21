Rails.application.routes.draw do
  get 'persons/profile', as: 'user_root'
  devise_scope :users do
  	get "/users/sign_out" => "devise/sessions#destroy"
   end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items  do
  	get :upvote,    on: :member
  	get :expensive, on: :collection
  end
  get "admin/users_count" => "admin#users_count"
  #get ':controller(/:action(/:id))(.:format)'
end
