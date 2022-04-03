Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  namespace :public do
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
    resources :orders,only:[:new,:create,:index,:show]
     post 'orders/confirm'
      get 'orders/thanks'

    resources :cart_items,only:[:index,:update,:delete,:create]
    delete 'cart_items/alldelete'
    resource :customers,only:[:show,:edit,:update]
    get 'customers/confirm'
    patch 'customers/withdrawal'
    resources :items,only:[:index,:show]
  end


  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get 'order_details/update'
    resources :orders,only:[:show,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :items,only:[:index,:new,:show,:create,:edit,:update]
    get 'homes/top'
  end



  root to: "public/homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
