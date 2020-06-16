Rails.application.routes.draw do
  get "cumulative", to: "areas#cumulative"
  get "daily", to: "areas#daily"
  get "average", to: "areas#average"

  namespace "admin" do
    resources :hits, only: :index
  end

  root to: "areas#cumulative"
end
