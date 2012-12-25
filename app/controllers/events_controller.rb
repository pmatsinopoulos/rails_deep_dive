class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @events = current_user.events
  end

  def create
    event = current_user.events.build params[:event]
    event.save
    redirect_to events_path
  end

  def edit
    @events = current_user.events
    @event = @events.find(params[:id])
    render :index
  end

  def update
    events = current_user.events
    event = events.find(params[:id])
    event.update_attributes(params[:event])
    redirect_to events_path
  end

  def destroy
    current_user.events.find(params[:id]).destroy
    redirect_to events_path
  end

  def show
    @event = current_user.events.find(params[:id])
  end
end
