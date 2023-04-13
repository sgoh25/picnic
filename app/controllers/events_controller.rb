class EventsController < ApplicationController
  before_action :authorize, only: [:show]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      session[:event_id] = @event.id
      redirect_to event_path(@event.id)
    else
      flash[:error] = "'#{@event.name}' is already taken!"
      flash.keep
      redirect_to root_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @sections = Section.where("event_id = '#{@event.id}'")
  end

  private

  def event_params
    params.required(:event).permit(:name, :password)
  end
end
