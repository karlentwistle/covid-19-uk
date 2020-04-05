Rails.application.routes.draw do
  get "cumulative", to: "regions#cumulative"
  get "daily", to: "regions#daily"
  root to: "regions#cumulative"
end
