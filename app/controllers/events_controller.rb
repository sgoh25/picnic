class EventsController < ApplicationController
  before_action :authorize, only: [:show]
  before_action :set_event, only: %i[ destroy ]

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
    @sections = Section.where("event_id = '#{@event.id}'").order("name ASC")
  end

  def destroy
    @sections = Section.where("event_id = '#{@event.id}'")
    @sections.each do |section|
      @items = Item.where("section_id = '#{section.id}'")
      @items.each do |item|
        item.destroy
      end
      section.destroy
    end
    @event.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Event deleted" }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.required(:event).permit(:name, :password)
  end
end
