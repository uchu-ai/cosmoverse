# frozen_string_literal: true

require "cosmoverse/proto/cosmos/tx/v1beta1/service_services_pb"

module Cosmoverse
  module Cosmos
    module Tx
      SERVICE = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::Service

      def self.received_txs(address)
        events = ["transfer.recipient='#{address}'"]

        request = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::GetTxsEventRequest.new(events:)

        Cosmoverse::Cosmos::Client.call(request)
      end

      def self.send_txs(address)
        events = ["message.sender='#{address}'"]

        request = Cosmoverse::Proto::Cosmos::Tx::V1beta1::Service::GetTxsEventRequest.new(events:)

        Cosmoverse::Cosmos::Client.call(request)
      end
    end
  end
end
