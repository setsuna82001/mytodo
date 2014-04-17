Mytodo::Application.routes.draw do
  
  root :to => 'manage#select'
  post '/', to: 'manage#select'
  
  get 'make',   to: 'manage#add'
  get 'change', to: 'manage#change'
  get 'del',    to: 'manage#del'

  post 'make',   to: 'manage#add'
  post 'change', to: 'manage#change'
  post 'del',    to: 'manage#del'
end
