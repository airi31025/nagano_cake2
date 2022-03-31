Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    resources :orders,only:[:show,:update]
  end
  namespace :admin do
    resources :customers,only:[:index,:show,:edit,:update]
  end
  namespace :admin do
    resources :genres,only:[:index,:create,:edit,:update]
  end
  namespace :admin do
    resources :items,only:[:index,:new,:show,:create,:edit,:update]
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
  end
  namespace :public do
    resources :orders,only:[:new,:confirm,:thanks,:create,:index,:show]
  end
  namespace :public do
    resources :cart_items,only:[:index,:update,:delete,:alldelete,:create]
  end
  namespace :public do
    resources :customers,only:[:show,:edit,:update,:confirm,:withdrawal]
  end
  namespace :public do
    resources :items,only:[:index,:show]
  end
  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to:"homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
