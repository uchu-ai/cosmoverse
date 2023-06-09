# frozen_string_literal: true

require "cosmoverse/cosmos/client/base"
require "cosmoverse/cosmos/client/grpc"
require "cosmoverse/cosmos/client/http"

module Cosmoverse
  module Cosmos
    module Client
      class << self
        def call(request_param)
          client_class_name = Cosmoverse::Cosmos.config.mode.to_s.capitalize

          Object.const_get("Cosmoverse::Cosmos::Client::#{client_class_name}").call(request_param)
        end
      end
    end
  end
end
