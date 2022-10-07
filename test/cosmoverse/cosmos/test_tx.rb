# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestTx < Minitest::Test
      def test_received_txs
        to_wallet = GaiaTestHelper.generate_wallet
        from_wallet = GaiaTestHelper.genesis_wallet
        GaiaTestHelper.send_tokens(to_wallet:, amount: "123uatom")
        GaiaTestHelper.wait_for_next_block

        received_txs =
          Cosmoverse::Cosmos::Tx.received_txs(to_wallet.address)

        tx = received_txs.txs.first

        assert_kind_of(Cosmoverse::Proto::Cosmos::Tx::V1beta1::Tx::Tx, tx)
        assert_match(from_wallet.address, tx.body.messages.first.value)
      end

      def test_send_txs
        to_wallet = GaiaTestHelper.generate_wallet
        from_wallet = GaiaTestHelper.generate_wallet
        GaiaTestHelper.send_tokens(to_wallet: from_wallet, amount: "1000uatom")
        GaiaTestHelper.wait_for_next_block
        GaiaTestHelper.send_tokens(to_wallet:, from_wallet:, amount: "123uatom")
        GaiaTestHelper.wait_for_next_block

        send_txs =
          Cosmoverse::Cosmos::Tx.send_txs(from_wallet.address)

        tx = send_txs.txs.last

        assert_kind_of(Cosmoverse::Proto::Cosmos::Tx::V1beta1::Tx::Tx, tx)
        assert_match(to_wallet.address, tx.body.messages.first.value)
      end
    end
  end
end
