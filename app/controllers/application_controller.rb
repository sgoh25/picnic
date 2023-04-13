class ApplicationController < ActionController::Base
  include ApplicationHelper

  def authorize
    if !current_event
      flash[:notice] = "403: Access Denied"
      flash.keep
      redirect_to root_path
    end
  end
end
