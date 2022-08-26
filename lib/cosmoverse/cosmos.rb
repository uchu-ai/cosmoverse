# frozen_string_literal: true

require "cosmoverse/cosmos/config"
require "cosmoverse/proto/cosmos/bank/v1beta1/query_services_pb"

module Cosmoverse
  module Cosmos
    # rubocop:disable Metrics/AbcSize
    def self.json_rpc_client(path:, proto:)
      uri = URI("#{config.tendermint_host}/abci_query")
      params = { path: "\"#{path}\"",
                 data: "\"#{proto.gsub("\n", '\n')}\"" }

      uri.query = URI.encode_www_form(params)
      request = Net::HTTP.get_response(uri)

      raise "Request was not successful #{request}" unless request.is_a?(Net::HTTPSuccess)

      rpc_response = JSON.parse(request.body)

      raise "RPC request was not successful #{rpc_response}" unless rpc_response.key?("result")

      Base64.decode64(rpc_response.fetch("result").fetch("response").fetch("value"))
    end
    # rubocop:enable Metrics/AbcSize

    # rubocop:disable Metrics/MethodLength
    def self.all_balances(address, rpc_host: nil)
      request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryAllBalancesRequest.new(address:)

      if rpc_host
        stub = Cosmoverse::Proto::Cosmos::Bank::V1beta1::Query::Stub.new(rpc_host, :this_channel_is_insecure)

        grpc_response = stub.all_balances(request)

        return grpc_response if grpc_response.is_a?(Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryAllBalancesResponse)

        raise "gRPC was not successful. The response is a #{grpc_response}"
      end

      value = json_rpc_client(
        path: "/cosmos.bank.v1beta1.Query/AllBalances",
        proto: request.to_proto
      )

      Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryAllBalancesResponse.decode(value)
    end
    # rubocop:enable Metrics/MethodLength

    def self.total_supply
      request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryAllBalancesRequest.new

      value = json_rpc_client(
        path: "/cosmos.bank.v1beta1.Query/TotalSupply",
        proto: request.to_proto
      )

      Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryTotalSupplyResponse.decode(value)
    end

    def self.denoms_metadata
      request = Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryDenomsMetadataRequest.new

      value = json_rpc_client(
        path: "/cosmos.bank.v1beta1.Query/DenomsMetadata",
        proto: request.to_proto
      )

      Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryDenomsMetadataResponse.decode(value)
    end
  end
end
