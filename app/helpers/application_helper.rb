module ApplicationHelper
  def logged_in?
    !!session[:event_id]
  end

  def current_event
    @current_event ||= Event.find_by_id(session[:event_id]) if !!session[:event_id]
  end
end
