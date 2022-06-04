# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestAllBalances < Minitest::Test
      def test_connection_to_local_test_grpc_endpoint
        address = "cosmos14eadktsf4zzah6har7h7a46tunnj7rq7lmppy5"

        all_balances = Cosmoverse::Cosmos.all_balances(address, rpc_host: "localhost:9090")
                                         .balances.map { |balance| { denom: balance.denom, amount: balance.amount } }

        assert_equal([{ denom: "uatom", amount: "1000000000000" }], all_balances)
      end

      def test_connection_to_local_test_rpc_endpoint
        address = "cosmos14eadktsf4zzah6har7h7a46tunnj7rq7lmppy5"

        all_balances = Cosmoverse::Cosmos.all_balances(address, tendermint_rpc_host: "http://localhost:26657")
                                         .balances.map { |balance| { denom: balance.denom, amount: balance.amount } }

        assert_equal([{ denom: "uatom", amount: "1000000000000" }], all_balances)
      end

      def test_default_connection_to_public_rpc_endpoint
        response = {
          jsonrpc: "2.0",
          id: -1,
          result: {
            response: {
              code: 0,
              log: "",
              info: "",
              index: "0",
              key: nil,
              value: "ChAKBXVhdG9tEgcyNDg4NjM5EgIQAQ==",
              proofOps: nil,
              height: "10935196",
              codespace: ""
            }
          }
        }

        url = "https://rpc.cosmos.network/abci_query?" \
              "data=%22%5Cn-cosmos111111111111111111111111111111111111111%22&" \
              "path=%22/cosmos.bank.v1beta1.Query/AllBalances%22"

        stub_request(:get, url)
          .to_return(status: 200, body: response.to_json)

        address = "cosmos111111111111111111111111111111111111111"

        all_balances = Cosmoverse::Cosmos.all_balances(address).balances.map do |balance|
          { denom: balance.denom, amount: balance.amount }
        end

        assert_equal([{ denom: "uatom", amount: "2488639" }], all_balances)
      end
    end
  end
end
