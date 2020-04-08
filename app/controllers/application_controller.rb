class ApplicationController < ActionController::Base
  after_action :track_action

  def track_action
    VisitEvent.create(controller_name: controller_name, action_name: action_name)
  end
end
