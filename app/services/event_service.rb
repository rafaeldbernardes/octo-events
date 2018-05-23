class EventService
  attr_reader :success, :errors, :record

  def initialize(parameters = {})
    @action = parameters[:action]
    @issue_number = parameters[:issue] ? parameters[:issue][:number] : ''
  end

  def create
    Issue.create!(id: @issue_number)
    save_record(Event.new(action: @action, issue_id: @issue_number))
  end

  private
    def save_record(event)
      if event.valid? && event.save
        @success = true
        @record = find_event(event.id)
      else
        @success = false
        @errors = event.errors.full_messages
      end
    end

    def find_event(event_id)
      Event.find(event_id)
    end
end