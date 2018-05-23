class EventsController < ApplicationController
  before_action :load_issue, only: [:index]

  def index
    render json: @issue.events, status: :ok
  end

  def create
    service = EventService.new(event_params)

    service.create

    if service.success
      render nothing: true, status: :created
    else
      render json: { errors: service.errors }, status: :unprocessable_entity
    end
  end

  private
    def event_params
      params
    end

    def load_issue
      @issue = Issue.find(params[:issue_id])
    end
end