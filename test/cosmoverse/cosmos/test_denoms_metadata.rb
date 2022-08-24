# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestDenomsMetadata < Minitest::Test
      def test_demons_metadata
        denoms_metadata = VCR.use_cassette("denoms_metadata") do
          Cosmoverse::Cosmos.denoms_metadata.metadatas.map(&:to_h)
        end

        assert_equal([
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
                     ], denoms_metadata)
      end
    end
  end
end
