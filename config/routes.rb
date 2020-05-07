Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'account/login', to: 'authentication#authenticate'
  post 'account/register', to: 'authentication#register'
  get 'account/data', to: 'user#get_data'
end
