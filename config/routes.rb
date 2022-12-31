Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :pessoas
    resources :vagas do
      match 'candidaturas/ranking', to: 'candidaturas#ranking', via: :get
    end
  end
end
