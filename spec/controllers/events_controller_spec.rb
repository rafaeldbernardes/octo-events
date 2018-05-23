require 'spec_helper'

RSpec.describe EventsController, type: :controller do

  describe 'GET index' do
    before(:each) do
      @issue = FactoryBot.create(:issue)
      @event = FactoryBot.create(:event, issue: @issue)

      allow(Issue).to receive(:find).and_return(@issue)
    end

    context 'json request' do
      it 'should return ok status' do
        get :index, xhr: true, params: { issue_id: @issue.id }

        expect(response).to have_http_status(:ok)
      end

      it 'should return the events' do
        get :index, xhr: true, params: { issue_id: @issue.id }

        expect(json.size).to eq(1)

        expect(json[0]["action"]).to eq(@event.action)
      end
    end
  end

  describe 'POST create' do
    before(:each) do
      @issue = FactoryBot.create(:issue)
      @event = FactoryBot.create(:event, issue: @issue)
      allow(EventService).to receive(:new).and_return(event_service)
    end

    context 'with invalid parameters' do
      let(:event_service) { double(:event_service, create: false, success: false, errors: ['foo']) }
      let(:parameters) {{ 'action' => '' }}

      it 'should return the unprocessable entity status' do
        post :create, params: parameters, xhr: true

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'should return the errors' do
        post :create, params: parameters, xhr: true

        expect_json_types(errors: :array_of_strings)
      end
    end

    context 'with valid parameters' do
      let(:event_service) { double(:event_service, create: true, success: true, record: @event, errors: []) }
      let(:parameters) {{ 'action' => 'opened' }}

      it 'should return the created status' do
        post :create, params: parameters, xhr: true

        expect(response).to have_http_status(:created)
      end
    end
  end
end