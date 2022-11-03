# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    module Client
      class Base
        def self.call(request_param)
          new(request_param).call
        end

        def initialize(request_param)
          @request = request_param.request
          @service_class = request_param.service_class
          @request_method = request_param.request_method
        end

        private

        def response_class
          Object.const_get(request.class.name.sub(/Request\z/, "Response"))
        end

        attr_reader :request, :service_class, :request_method
      end
    end
  end
end
