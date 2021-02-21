class ApplicationController < ActionController::Base
  after_action :track_action

  def track_action
    ahoy.track "Processed #{controller_name}##{action_name}", request.filtered_parameters
  end
end
