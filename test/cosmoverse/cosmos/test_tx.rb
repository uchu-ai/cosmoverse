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

      def test_get_delegation_tx
        tx_hash = "38F22F62917997C377C15A6B8F43E31DB65D37398D3925653B08C6436B0D91ED"

        tx = Cosmoverse::Cosmos.config.stub :tendermint_host, TendermintTestHelper.host do
          Cosmoverse::Cosmos.config.stub :mode, :http do
            Cosmoverse::Cosmos::Tx.get_tx(tx_hash)
          end
        end

        expected_event = Cosmoverse::Cosmos::Tx::DelegationEvent.new(
          "cosmos1llxlxmc7zv5c2cze5fm6pqx8u8ntf3xjftr8sj",
          "9uatom",
          "cosmos1fl48vsnmsdzcv85q5d2q4z5ajdha8yu34mf0eh",
          "3100000uatom"
        )

        assert_equal(tx.events, [expected_event])
      end

      def test_get_reward_tx
        tx_hash = "E3709ECAF79C9AED5878829564864A49B2C005E8109B5E9877DDC30A5E4B00C2"

        tx = Cosmoverse::Cosmos.config.stub :tendermint_host, TendermintTestHelper.host do
          Cosmoverse::Cosmos.config.stub :mode, :http do
            Cosmoverse::Cosmos::Tx.get_tx(tx_hash)
          end
        end

        expected_event = Cosmoverse::Cosmos::Tx::RewardEvent.new(
          "cosmos1llxlxmc7zv5c2cze5fm6pqx8u8ntf3xjftr8sj",
          "cosmos1jv65s3grqf6v6jl3dp4t6c9t9rk99cd88lyufl",
          "85029uatom"
        )

        assert_equal(tx.events, [expected_event])
      end

      def test_get_undeligate_tx
        tx_hash = "624D70A7506D41A0E6601965BA321E518804F7AF6D6077E9771A0841B9D8CD13"

        tx = Cosmoverse::Cosmos.config.stub :tendermint_host, TendermintTestHelper.host do
          Cosmoverse::Cosmos.config.stub :mode, :http do
            Cosmoverse::Cosmos::Tx.get_tx(tx_hash)
          end
        end

        expected_event = Cosmoverse::Cosmos::Tx::UndeligateEvent.new(
          "cosmosvaloper1kgddca7qj96z0qcxr2c45z73cfl0c75p7f3s2e",
          "5099999uatom",
          Time.new(2023, 5, 24, 11, 26, 0o6, 0),
          "cosmos1fr09ysppqvh20ame5wtfck8a4tc6gmsu9x9q7n",
          "123914uatom"
        )

        assert_equal(tx.events, [expected_event])
      end

      def test_received_txs
        amount = "123uatom"
        to_wallet = GaiaTestHelper.generate_wallet
        from_wallet = GaiaTestHelper.genesis_wallet
        test_tx = GaiaTestHelper.send_tokens(to_wallet:, amount:)
        GaiaTestHelper.wait_for_next_block

        txs =
          Cosmoverse::Cosmos::Tx.received_txs(to_wallet.address)

        assert_instance_of(Tx::Collection, txs)
        assert_equal(1, txs.count)

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

        assert_instance_of(Tx::Collection, txs)
        assert_equal(1, txs.count)

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
