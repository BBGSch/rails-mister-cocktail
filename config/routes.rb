Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # #create
  # get "cocktails/new", to: "cocktails#new"
  # post "cocktails/", to: "cocktails#create"

  # #read
  # get "cocktails", to: "cocktails#index"
  # get "cocktails/:id", to: "cocktails#show", as: :cocktail
  
  # #update
  # get "cocktails/:id/edit", to: "cocktails#edit"
  # patch "cocktails/:id/", to: "cocktails#update"
  # #delete
  # delete "cocktails/:id/", to: "cocktails#destroy"


  resources :cocktails do
    resources :doses, only: [ :new, :create, :edit, :update, :destroy ], shallow: true
  end

end
