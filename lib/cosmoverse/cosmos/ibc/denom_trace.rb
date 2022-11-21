# frozen_string_literal: true

require "cosmoverse/proto/ibc/applications/transfer/v1/query_services_pb"

module Cosmoverse
  module Cosmos
    module Ibc
      class DenomTrace
        RequestParamter = Struct.new("IbcRequestParamter", :request, :request_method) do
          def service_class
            Cosmoverse::Proto::Ibc::Applications::Transfer::V1::Query::Service
          end
        end

        class Collection
          extend Cosmoverse::Cosmos::Collectable::Loadable
          include Cosmoverse::Cosmos::Collectable

          def records
            response.denom_traces.map { |dt| DenomTrace.new(dt) }
          end
        end

        attr_reader :path, :base_denom

        def initialize(denom_trace)
          @path = denom_trace.path
          @base_denom = denom_trace.base_denom
        end

        def ==(other)
          path == other.path && base_denom == other.base_denom
        end

        alias eql? ==

        def hash
          [self.class, path, base_denom].hash
        end

        def self.get(ibc_denom)
          hash = ibc_denom.sub("ibc/", "")

          request = Cosmoverse::Proto::Ibc::Applications::Transfer::V1::QueryDenomTraceRequest.new(hash:)
          request_param = RequestParamter.new(request, :denom_trace)
          new(Cosmoverse::Cosmos::Client.call(request_param).denom_trace)
        end

        def self.page(**args)
          request = Cosmoverse::Proto::Ibc::Applications::Transfer::V1::QueryDenomTracesRequest.new
          request_param = RequestParamter.new(request, :denom_traces)

          Collection.get(request_param, **args)
        end
      end
    end
  end
end
