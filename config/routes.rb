Rails.application.routes.draw do
  get 'proxy_gen/entry'

  post 'proxy_gen/build'
  
  root :to => redirect('proxy_gen/entry')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
