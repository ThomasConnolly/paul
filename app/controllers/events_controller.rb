# typed: false
# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :admin_only, only: %i[new edit destroy create]
  before_action :set_event, only: %i[show edit update destroy]

  def index
    @events = Event.order(date: :desc)
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to(@event, notice: 'Event was successfully created.')
    else
      render(:new)
    end
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to(@event, notice: 'Event was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to(events_url, notice: 'Event was successfully destroyed.')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def admin_only
    nil if user_signed_in? && current_user.roles.include?('admin')
  end

  def event_params
    params.expect(event: %i[title price quantity amount time date
                            event_picture])
  end
end
