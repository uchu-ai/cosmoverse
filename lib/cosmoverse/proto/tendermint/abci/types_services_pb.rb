# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: tendermint/abci/types.proto for package 'cosmoverse.proto.tendermint.abci'

require "grpc"
require "tendermint/abci/types_pb"

module Cosmoverse
  module Proto
    module Tendermint
      module Abci
        module ABCIApplication
          # ----------------------------------------
          # Service Definition
          #
          class Service
            include ::GRPC::GenericService

            self.marshal_class_method = :encode
            self.unmarshal_class_method = :decode
            self.service_name = "tendermint.abci.ABCIApplication"

            rpc :Echo, ::Cosmoverse::Proto::Tendermint::Abci::RequestEcho,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseEcho
            rpc :Flush, ::Cosmoverse::Proto::Tendermint::Abci::RequestFlush,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseFlush
            rpc :Info, ::Cosmoverse::Proto::Tendermint::Abci::RequestInfo,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseInfo
            rpc :SetOption, ::Cosmoverse::Proto::Tendermint::Abci::RequestSetOption,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseSetOption
            rpc :DeliverTx, ::Cosmoverse::Proto::Tendermint::Abci::RequestDeliverTx,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseDeliverTx
            rpc :CheckTx, ::Cosmoverse::Proto::Tendermint::Abci::RequestCheckTx,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseCheckTx
            rpc :Query, ::Cosmoverse::Proto::Tendermint::Abci::RequestQuery,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseQuery
            rpc :Commit, ::Cosmoverse::Proto::Tendermint::Abci::RequestCommit,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseCommit
            rpc :InitChain, ::Cosmoverse::Proto::Tendermint::Abci::RequestInitChain,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseInitChain
            rpc :BeginBlock, ::Cosmoverse::Proto::Tendermint::Abci::RequestBeginBlock,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseBeginBlock
            rpc :EndBlock, ::Cosmoverse::Proto::Tendermint::Abci::RequestEndBlock,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseEndBlock
            rpc :ListSnapshots, ::Cosmoverse::Proto::Tendermint::Abci::RequestListSnapshots,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseListSnapshots
            rpc :OfferSnapshot, ::Cosmoverse::Proto::Tendermint::Abci::RequestOfferSnapshot,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseOfferSnapshot
            rpc :LoadSnapshotChunk, ::Cosmoverse::Proto::Tendermint::Abci::RequestLoadSnapshotChunk,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseLoadSnapshotChunk
            rpc :ApplySnapshotChunk, ::Cosmoverse::Proto::Tendermint::Abci::RequestApplySnapshotChunk,
                ::Cosmoverse::Proto::Tendermint::Abci::ResponseApplySnapshotChunk
          end

          Stub = Service.rpc_stub_class
        end
      end
    end
  end
end