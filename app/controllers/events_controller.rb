class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      session[:event_id] = @event.id
      redirect_to event_path(@event.id)
    else
      message = "Event name is already taken!"
      redirect_to root_path notice: message
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.required(:event).permit(:name, :password)
  end
end
