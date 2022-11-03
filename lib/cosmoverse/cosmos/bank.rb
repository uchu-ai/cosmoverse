# frozen_string_literal: true

require "cosmoverse/proto/cosmos/bank/v1beta1/query_services_pb"

module Cosmoverse
  module Cosmos
    module Bank
      RequestParamter = Struct.new("RequestParamter", :request, :request_method) do
        def service_class
          Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::Query::Service
        end
      end

      def self.all_balances(address)
        request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::QueryAllBalancesRequest.new(address:)
        request_param = RequestParamter.new(request, :all_balances)
        Cosmoverse::Cosmos::Client.call(request_param)
      end

      def self.total_supply
        request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::QueryTotalSupplyRequest.new
        request_param = RequestParamter.new(request, :total_supply)
        Cosmoverse::Cosmos::Client.call(request_param)
      end

      def self.denoms_metadata
        request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::QueryDenomsMetadataRequest.new
        request_param = RequestParamter.new(request, :denoms_metadata)
        Cosmoverse::Cosmos::Client.call(request_param)
      end
    end
  end
end
