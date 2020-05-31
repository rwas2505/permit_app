Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/jobs" => "jobs#index"
    post "/jobs" => "jobs#create"
    get "/jobs/:id" => "jobs#show"
    patch "/jobs/:id" => "jobs#update"
    delete "/jobs/:id" => "jobs#destroy"

    get "/rejections" => "rejections#index"
    post "/rejections" => "rejections#create"
    get "/rejections/:id" => "rejections#show"
    patch "/rejections/:id" => "rejections#update"
    delete "/rejections/:id" => "rejections#destroy"
    
    get "/categories" => "categories#index"
    post "/categories" => "categories#create"
    get "/categories/:id" => "categories#show"
    patch "/categories/:id" => "categories#update"
    delete "/categories/:id" => "categories#destroy"


  end
end
