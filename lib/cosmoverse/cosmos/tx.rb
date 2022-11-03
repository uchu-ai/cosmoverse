# frozen_string_literal: true

require "cosmoverse/proto/cosmos/tx/v1beta1/service_services_pb"

module Cosmoverse
  module Cosmos
    class Tx
      attr_reader :block_height, :tx_hash, :gas_wanted, :gas_used

      RequestParamter = Struct.new("RequestParamter", :request, :request_method) do
        def service_class
          Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::Service::Service
        end
      end

      TransferEvent = Struct.new("TransferEvent", :recipient, :sender, :amount)

      class Collection
        extend Cosmoverse::Cosmos::Collectable::Loadable
        include Cosmoverse::Cosmos::Collectable

        def records
          response.tx_responses.map { |txr| Tx.new(txr) }
        end
      end

      def self.get_tx(hash)
        request = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::GetTxRequest.new(hash:)
        request_param = RequestParamter.new(request, :get_tx)
        response = Cosmoverse::Cosmos::Client.call(request_param)

        new(response.tx_response)
      end

      def self.received_txs(address, **args)
        events = ["transfer.recipient='#{address}'"]
        request = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::GetTxsEventRequest.new(events:)
        request_param = RequestParamter.new(request, :get_txs_event)

        Collection.get(request_param, **args)
      end

      def self.send_txs(address, **args)
        events = ["message.sender='#{address}'"]
        request = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::GetTxsEventRequest.new(events:)
        request_param = RequestParamter.new(request, :get_txs_event)

        Collection.get(request_param, **args)
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
