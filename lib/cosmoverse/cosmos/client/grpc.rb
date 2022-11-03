# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    module Client
      class Grpc < Base
        def call
          stub.public_send(request_method, request)
        end

        private

        def stub
          stub_class.new(
            "#{Cosmoverse::Cosmos.config.grpc_host}:#{Cosmoverse::Cosmos.config.grpc_port}",
            :this_channel_is_insecure
          )
        end

        def stub_class
          *names, _ = service_class.name.split("::")

          Object.const_get("#{names.join("::")}::Stub")
        end
      end
    end
  end
end
