Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  authenticated :user, ->(user) { user.admin? } do
    root 'admin/home#index', as: :admin_root
  end

  authenticated :user, ->(user) { user.client? } do
    root 'client/home#index', as: :client_root
  end

  unauthenticated do
    root 'home#index'
  end
end

