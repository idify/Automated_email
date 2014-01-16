AutomatedEmail::Application.routes.draw do
 # get "homes/index"

#  devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
 # 
   resources :mailes 
  match 'maile/pending' => 'mailes#pending_mail'

  resources :mailes
  root :to => "mailes#index"

end
