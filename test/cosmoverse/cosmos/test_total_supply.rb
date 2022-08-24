# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestTotalSupply < Minitest::Test
      def test_total_supply
        total_supply = Cosmoverse::Cosmos.total_supply(tendermint_rpc_host: "http://localhost:26657")
                                         .supply.map(&:to_h)

        assert_includes(total_supply, { denom: "uatom", amount: "1000000000000" })
      end
    end
  end
end
