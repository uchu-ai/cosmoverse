# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestBank < Minitest::Test
      def test_all_balances
        address = GaiaTestHelper.generate_address
        GaiaTestHelper.send_tokens(address:, amount: "123uatom")
        GaiaTestHelper.wait_for_next_block

        all_balances =
          Cosmoverse::Cosmos::Bank.all_balances(address)
                                  .balances.map { |balance| { denom: balance.denom, amount: balance.amount } }

        assert_equal([{ denom: "uatom", amount: "123" }], all_balances)
      end

      def test_total_supply
        total_supply = Cosmoverse::Cosmos::Bank.total_supply.supply.map(&:to_h)

        assert_includes(total_supply, { denom: "uatom", amount: "1000000000000" })
      end

      def test_denoms_meta
        denoms_metadata = VCR.use_cassette("denoms_metadata") do
          Cosmoverse::Cosmos.config.stub :tendermint_host, "https://rpc.cosmos.network" do
            Cosmoverse::Cosmos.config.stub :mode, :http do
              Cosmoverse::Cosmos::Bank.denoms_metadata.metadatas.map(&:to_h)
            end
          end
        end

        assert_equal(
          [
            {
              description: "The native staking token of the Cosmos Hub.",
              denom_units: [
                {
                  denom: "uatom",
                  exponent: 0,
                  aliases: ["microatom"]
                },
                {
                  denom: "matom",
                  exponent: 3,
                  aliases: ["milliatom"]
                },
                {
                  denom: "atom", exponent: 6, aliases: []
                }
              ],
              base: "uatom",
              display: "atom",
              name: "",
              symbol: "",
              uri: "",
              uri_hash: ""
            }
          ], denoms_metadata
        )
      end
    end
  end
end
