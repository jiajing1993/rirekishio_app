Rails.application.routes.draw do
  root "main_pages#home"

  devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations',
      confirmations: 'users/confirmations'
  }, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'signup'
  }
end
