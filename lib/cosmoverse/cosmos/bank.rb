# frozen_string_literal: true

require "cosmoverse/proto/cosmos/bank/v1beta1/query_services_pb"

module Cosmoverse
  module Cosmos
    module Bank
      SERVICE = Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::Query

      def self.all_balances(address)
        request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::QueryAllBalancesRequest.new(address:)
        Cosmoverse::Cosmos::Client.call(request)
      end

      def self.total_supply
        request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::QueryTotalSupplyRequest.new
        Cosmoverse::Cosmos::Client.call(request)
      end

      def self.denoms_metadata
        request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::QueryDenomsMetadataRequest.new
        Cosmoverse::Cosmos::Client.call(request)
      end
    end
  end
end
