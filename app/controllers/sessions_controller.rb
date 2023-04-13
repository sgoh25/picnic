class SessionsController < ApplicationController
  require "bcrypt"

  def create
    @event = Event.find_by(name: params[:name])

    if !!@event && @event.authenticate(params[:password])
      session[:event_id] = @event.id
      redirect_to event_path(@event.id)
    else
      message = "Incorrect username/password"
      redirect_to login_path notice: message
    end
  end

  def destroy
    session.delete(:event_id)
    @event = nil
    redirect_to root_path
  end
end
