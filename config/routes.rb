Rails.application.routes.draw do
  root 'index#index'
  get 'cats/tick'
  get 'cats/:id/rest', to: 'cats#rest'
  resources 'cats'
  get 'user/login'
  post 'user/login'
  get 'user/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
