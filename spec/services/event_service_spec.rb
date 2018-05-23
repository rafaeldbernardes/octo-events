require 'spec_helper'

RSpec.describe EventService, type: :service do

  let(:service) { described_class.new(parameters) }

  describe 'event creation' do
    before(:each) do
      @issue = FactoryBot.create(:issue)
      @event = FactoryBot.create(:event, issue: @issue)

      allow_any_instance_of(Event).to receive(:create).and_return(@event)
      allow_any_instance_of(Event).to receive(:find).and_return(@event)
    end

    context 'with invalid data' do
      let(:parameters) {{ 'action' => '', 'payload' => 'dasdasdsa' }}

      before(:each) do
        allow_any_instance_of(Event).to receive(:create).and_return(false)
      end

      it 'should return false' do
        service.create

        expect(service.success).to eq(false)
      end

      it 'should return the errors' do
        service.create

        expect(service.errors).to_not be_empty
        expect(service.errors[0]).to eq("Action can't be blank")
      end
    end

    context 'with valid data' do
      let(:parameters) {{ 'action': 'Foo', 'issue': { 'number': '25' } }}

      it 'should return true' do
        service.create

        expect(service.success).to eq(true)
      end

      it 'should not return the errors' do
        service.create

        expect(service.errors).to eq(nil)
      end
    end
  end
end