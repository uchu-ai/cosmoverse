# frozen_string_literal: true

require "cosmoverse/proto/cosmos/tx/v1beta1/service_services_pb"

module Cosmoverse
  module Cosmos
    class Tx
      attr_reader :block_height, :tx_hash, :gas_wanted, :gas_used

      SERVICE = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::Service

      TransferEvent = Struct.new("TransferEvent", :recipient, :sender, :amount)

      def self.received_txs(address)
        events = ["transfer.recipient='#{address}'"]

        request = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::GetTxsEventRequest.new(events:)
        response = Cosmoverse::Cosmos::Client.call(request)

        response.tx_responses.map { |txr| new(txr) }
      end

      def self.send_txs(address)
        events = ["message.sender='#{address}'"]

        request = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::GetTxsEventRequest.new(events:)
        response = Cosmoverse::Cosmos::Client.call(request)

        response.tx_responses.map { |txr| new(txr) }
      end

      def initialize(tx_response)
        @block_height = tx_response.height
        @tx_hash = tx_response.txhash
        @gas_wanted = tx_response.gas_wanted
        @gas_used = tx_response.gas_used
        @logs = tx_response.logs
      end

      def ==(other)
        tx_hash == other.tx_hash
      end

      alias eql? ==

      def hash
        [self.class, tx_hash].hash
      end

      def events
        @logs.map do |log|
          case log.events.map(&:type)
          when %w[coin_received coin_spent message transfer]
            TransferEvent.new(*log.events.last.attributes.map(&:value))
          else
            raise "Unknown ABCIMessageLog at '#{log.msg_index}' for tx: '#{tx_hash}'"
          end
        end
      end
    end
  end
end
