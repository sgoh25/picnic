class ApplicationController < ActionController::Base
  include ApplicationHelper

  def authorize
    if !current_event
      redirect_to root_path notice: "Entry Denied"
    end
  end
end
