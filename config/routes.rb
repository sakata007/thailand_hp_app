Rails.application.routes.draw do
  
  post '/confirm'=> 'orders#confirm', as: 'confirm'
  post '/complete'=> 'orders#complete', as: 'complete'
  post '/back'=> 'orders#back', as: 'back'
  get '/'=> 'orders#index', as: 'top'
  
  # TODO: /admin以下にbasic認証
  namespace :admin do
    resources :products, expect: [:show]
  end

  # メールテストのため追記
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
