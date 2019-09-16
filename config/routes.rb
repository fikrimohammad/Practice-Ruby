Rails.application.routes.draw do
  resources :friend_requests
  namespace 'api' do
    namespace 'v1' do
      scope 'users' do
        get '', to: 'users#index'
        get ':id/manager', to: 'users#show_manager'
        get ':id/subordinates', to: 'users#show_subordinates'
        post '', to: 'users#create'
        put ':id', to: 'users#update'

        scope 'friends' do
          scope 'requests' do
            get ':user_id', to: 'friend_requests#index'
            post 'create', to: 'friend_requests#create'
            post 'approve', to: 'friend_requests#approve'
          end
        end

      end
    end
  end
end
