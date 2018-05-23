module Json
  module Helpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end
end