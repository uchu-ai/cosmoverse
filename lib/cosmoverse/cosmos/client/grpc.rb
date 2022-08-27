# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    module Client
      class Grpc
        def self.call(request)
          new(request).call
        end

        def initialize(request)
          @request = request
        end

        def call
          response = stub.public_send(request_method, request)
          return response if response.is_a?(response_class)

          raise "gRPC was not successful. The response is a #{grpc_response}"
        end

        private

        def response_class
          Object.const_get(request.class.name.sub(/Request\z/, "Response"))
        end

        def stub
          names = request.class.name.split("::")
          names[-1] = names[-1].split(/(?=[A-Z])/).first
          Object.const_get("#{names.join("::")}::Stub").new(
            "#{Cosmoverse::Cosmos.config.grpc_host}:#{Cosmoverse::Cosmos.config.grpc_port}",
            :this_channel_is_insecure
          )
        end

        def request_method
          request.class.name.split("::").last.split(/(?=[A-Z])/)[1..-2].map(&:downcase).join("_")
        end

        attr_reader :request
      end
    end
  end
end
