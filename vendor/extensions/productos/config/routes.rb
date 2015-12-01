Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :productos do
    resources :productos, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :productos, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :productos, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
