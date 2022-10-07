# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestTx < Minitest::Test
      def test_received_txs
        sender_address = "cosmos14eadktsf4zzah6har7h7a46tunnj7rq7lmppy5"
        address = GaiaTestHelper.generate_address
        GaiaTestHelper.send_tokens(address:, amount: "123uatom")
        GaiaTestHelper.wait_for_next_block

        received_txs =
          Cosmoverse::Cosmos::Tx.received_txs(address)

        tx = received_txs.txs.first

        assert_kind_of(Cosmoverse::Proto::Cosmos::Tx::V1beta1::Tx::Tx, tx)
        assert_match(sender_address, tx.body.messages.first.value)
      end

      def test_send_txs
        sender_address = "cosmos14eadktsf4zzah6har7h7a46tunnj7rq7lmppy5"
        address = GaiaTestHelper.generate_address
        GaiaTestHelper.send_tokens(address:, amount: "123uatom")
        GaiaTestHelper.wait_for_next_block

        send_txs =
          Cosmoverse::Cosmos::Tx.send_txs(sender_address)

        tx = send_txs.txs.last

        assert_kind_of(Cosmoverse::Proto::Cosmos::Tx::V1beta1::Tx::Tx, tx)
        assert_match(address, tx.body.messages.first.value)
      end
    end
  end
end
