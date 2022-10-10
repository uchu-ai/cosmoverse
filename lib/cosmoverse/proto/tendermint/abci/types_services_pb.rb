# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: tendermint/abci/types.proto for package 'Cosmoverse.Proto.Tendermint.Abci.Types'

require 'grpc'
require 'cosmoverse/proto/tendermint/abci/types_pb'

module Cosmoverse
  module Proto
    module Tendermint
      module Abci
        module Types
          module ABCIApplication
            # ----------------------------------------
            # Service Definition
            #
            class Service
              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = 'tendermint.abci.ABCIApplication'

              rpc :Echo, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestEcho, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseEcho
              rpc :Flush, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestFlush, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseFlush
              rpc :Info, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestInfo, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseInfo
              rpc :DeliverTx, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestDeliverTx, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseDeliverTx
              rpc :CheckTx, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestCheckTx, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseCheckTx
              rpc :Query, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestQuery, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseQuery
              rpc :Commit, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestCommit, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseCommit
              rpc :InitChain, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestInitChain, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseInitChain
              rpc :BeginBlock, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestBeginBlock, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseBeginBlock
              rpc :EndBlock, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestEndBlock, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseEndBlock
              rpc :ListSnapshots, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestListSnapshots, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseListSnapshots
              rpc :OfferSnapshot, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestOfferSnapshot, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseOfferSnapshot
              rpc :LoadSnapshotChunk, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestLoadSnapshotChunk, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseLoadSnapshotChunk
              rpc :ApplySnapshotChunk, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestApplySnapshotChunk, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseApplySnapshotChunk
              rpc :PrepareProposal, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestPrepareProposal, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponsePrepareProposal
              rpc :ProcessProposal, ::Cosmoverse::Proto::Tendermint::Abci::Types::RequestProcessProposal, ::Cosmoverse::Proto::Tendermint::Abci::Types::ResponseProcessProposal
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end