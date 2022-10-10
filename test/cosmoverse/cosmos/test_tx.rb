# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestTx < Minitest::Test
      def test_get_tx
        amount = "123uatom"
        to_wallet = GaiaTestHelper.generate_wallet
        from_wallet = GaiaTestHelper.genesis_wallet
        test_tx = GaiaTestHelper.send_tokens(to_wallet:, amount:)
        GaiaTestHelper.wait_for_next_block

        event = Cosmoverse::Cosmos::Tx::TransferEvent.new(
          to_wallet.address,
          from_wallet.address,
          amount
        )

        tx =
          Cosmoverse::Cosmos::Tx.get_tx(test_tx.tx_hash)

        assert_equal tx.tx_hash, test_tx.tx_hash
        assert_equal tx.events, [event]
      end

      def test_received_txs
        amount = "123uatom"
        to_wallet = GaiaTestHelper.generate_wallet
        from_wallet = GaiaTestHelper.genesis_wallet
        test_tx = GaiaTestHelper.send_tokens(to_wallet:, amount:)
        GaiaTestHelper.wait_for_next_block

        txs =
          Cosmoverse::Cosmos::Tx.received_txs(to_wallet.address)

        assert_equal(1, txs.size)

        event = Cosmoverse::Cosmos::Tx::TransferEvent.new(
          to_wallet.address,
          from_wallet.address,
          amount
        )

        tx = txs.first

        assert_equal tx.tx_hash, test_tx.tx_hash
        assert_equal tx.events, [event]
      end

      def test_send_txs
        amount = "123uatom"
        to_wallet = GaiaTestHelper.generate_wallet
        from_wallet = GaiaTestHelper.generate_wallet
        GaiaTestHelper.send_tokens(to_wallet: from_wallet, amount: "1000uatom")
        GaiaTestHelper.wait_for_next_block
        test_tx = GaiaTestHelper.send_tokens(to_wallet:, from_wallet:, amount:)
        GaiaTestHelper.wait_for_next_block

        txs =
          Cosmoverse::Cosmos::Tx.send_txs(from_wallet.address)

        assert_equal(1, txs.size)

        event = Cosmoverse::Cosmos::Tx::TransferEvent.new(
          to_wallet.address,
          from_wallet.address,
          amount
        )

        tx = txs.first

        assert_equal tx.tx_hash, test_tx.tx_hash
        assert_equal tx.events, [event]
      end
    end
  end
end
