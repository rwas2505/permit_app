Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/rejections" => "rejections#index"
    post "/rejections" => "rejections#create"
    get "/rejections/:id" => "rejections#show"
    patch "/rejections/:id" => "rejections#update"
    delete "/rejections/:id" => "rejections#destroy"
  end
end
