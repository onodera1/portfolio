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
   get'about_pages'=>'top_pages#about_pages'
   get'industry_pages'=>'top_pages#industry_pages'
   resources :counselings do
     resources :counseling_likes, only: [:create, :destroy]
     resources :counseling_comments, only: [:create, :destroy]do
       resources :counseling_comment_likes, only: [:create, :destroy]

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
     resources :sharing_likes, only: [:create, :destroy]
     resources :sharing_comments, only: [:create, :destroy]
     resources :sharing_stocks, only: [:create, :destroy]
   end

end
