Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :loan, only: [:show, :create, :destroy]
    end
  end
end
