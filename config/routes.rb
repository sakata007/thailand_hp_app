Rails.application.routes.draw do
  
  post '/confirm'=> 'orders#confirm', as: 'confirm'
  post '/complete'=> 'orders#complete', as: 'complete'
  get '/'=> 'orders#index', as: 'top'
  
  # TODO: /admin以下にbasic認証
  get '/admin/products/create'=> 'products#create', as: 'create_product'
  post '/admin/products/store'=> 'products#store', as: 'store_product'
end
