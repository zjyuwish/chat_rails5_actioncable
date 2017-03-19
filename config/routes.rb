Rails.application.routes.draw do
  scope "(/:locale)" do
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   
    resources :chat_rooms, only: [:new, :create, :show, :index]
    mount ActionCable.server => '/cable'
  end
  root to: 'chat_rooms#index'
  get '/:locale' => 'chat_rooms#index'
end
