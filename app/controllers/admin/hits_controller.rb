class Admin::HitsController < ApplicationController
  skip_after_action :track_action

  layout "admin"

  def index
    @hits = VisitEvent.group_by_day(:created_at).count
  end
end
