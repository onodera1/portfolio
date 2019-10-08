Rails.application.routes.draw do

  #devise_for :users
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # get 'top' => 'top_pages#top'

   root 'top_pages#top'
   resources :counselings
   resources :industries
   resources :users
   resources :sharings do
     resources :sharinglikes, only: [:create, :destroy]
   end

end
