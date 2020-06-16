class ApplicationController < ActionController::Base
  after_action :track_action, unless: :ignored_ip_address?

  def track_action
    VisitEvent.create(controller_name: controller_name, action_name: action_name)
  end

  def ignored_ip_address?
    request.remote_ip == ENV['IGNORED_IP']
  end
end
