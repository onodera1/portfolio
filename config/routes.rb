Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'relationships/create'
  get 'relationships/destroy'
  #devise_for :users
  devise_for :users, :controllers => {
  	:registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # get 'top' => 'top_pages#top'
   get'result_index'=>'top_pages#result_index'
   root 'top_pages#top'
   resources :counselings do
     resources :counselinglikes, only: [:create, :destroy]
     resources :counselingcomments, only: [:create, :destroy]do
       resources :counselingcommentslikes, only: [:create, :destroy]

     end
   end
   resources :industries
   resources :users do
     resource :relationships, only: [:create, :destroy]
      get :follows, on: :member 
      get :followers, on: :member 
    get 'mycounseling_pages/'  =>'users#mycounseling_pages',as: :mycounseling_pages
    get 'mysharing_pages' => 'users#mysharing_pages',as: :mysharing_pages
    get 'mysharingstock_pages'=>'users#mysharingstock_pages',as: :mysharingstock_pages
   end


   resources :sharings do
     resources :sharinglikes, only: [:create, :destroy]
     resources :sharingcomments, only: [:create, :destroy]
     resources :sharingstocks, only: [:create, :destroy]
   end

end
