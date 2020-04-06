Rails.application.routes.draw do
  get "cumulative", to: "areas#cumulative"
  get "daily", to: "areas#daily"
  root to: "areas#cumulative"
end
