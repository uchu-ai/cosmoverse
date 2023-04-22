# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestBank < Minitest::Test
      def test_all_balances
        wallet = GaiaTestHelper.generate_wallet
        GaiaTestHelper.send_tokens(to_wallet: wallet, amount: "123uatom")
        GaiaTestHelper.wait_for_next_block

        all_balances =
          Cosmoverse::Cosmos::Bank.all_balances(wallet.address)
                                  .balances.map { |balance| { denom: balance.denom, amount: balance.amount } }

        assert_equal([{ denom: "uatom", amount: "123" }], all_balances)
      end

      def test_total_supply
        total_supply = Cosmoverse::Cosmos::Bank.total_supply.supply.map(&:to_h)

        assert_includes(total_supply, { denom: "uatom", amount: "1000000000000" })
      end

      def test_denoms_meta
        denoms_metadata = Cosmoverse::Cosmos.config.stub :tendermint_host, TendermintTestHelper.host do
          Cosmoverse::Cosmos.config.stub :mode, :http do
            Cosmoverse::Cosmos::Bank.denoms_metadata.metadatas.map(&:to_h)
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
                  denom: "atom",
                  exponent: 6,
                  aliases: []
                }
              ],
              base: "uatom",
              display: "atom",
              name: "Cosmos Hub Atom",
              symbol: "ATOM",
              uri: "",
              uri_hash: ""
            }
          ], denoms_metadata
        )
      end
    end
  end
end
