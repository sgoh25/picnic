class SessionsController < ApplicationController
  require "bcrypt"

  def create
    @event = Event.find_by(name: params[:name])

    if !!@event && @event.authenticate(params[:password])
      session[:event_id] = @event.id
      redirect_to event_path(@event.id)
    else
      flash[:error] = "Incorrect username/password"
      flash.keep
      redirect_to login_path
    end
  end

  def destroy
    session[:event_id] = nil
    @event = nil
    redirect_to root_path
  end
end
