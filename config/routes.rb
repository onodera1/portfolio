Rails.application.routes.draw do

  #devise_for :users
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # get 'top' => 'top_pages#top'
  
   root 'top_pages#top'
   resources :counselings do
     resources :counselinglikes, only: [:create, :destroy]
     resources :counselingcomments, only: [:create, :destroy]
      end
   resources :industries
   resources :users do
    get 'mycounseling_pages/'  =>'users#mycounseling_pages',as: :mycounseling_pages
    get 'mysharing_pages' => 'users#mysharing_pages',as: :mysharing_pages
   end

   resources :sharings do
     resources :sharinglikes, only: [:create, :destroy]
     resources :sharingcomments, only: [:create, :destroy]
   end

end
