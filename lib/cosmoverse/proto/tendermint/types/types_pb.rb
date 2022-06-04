# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tendermint/types/types.proto

require "google/protobuf"

require "google/protobuf/timestamp_pb"
require "tendermint/crypto/proof_pb"
require "tendermint/version/types_pb"
require "tendermint/types/validator_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tendermint/types/types.proto", syntax: :proto3) do
    add_message "cosmoverse.proto.tendermint.types.PartSetHeader" do
      optional :total, :uint32, 1
      optional :hash, :bytes, 2
    end
    add_message "cosmoverse.proto.tendermint.types.Part" do
      optional :index, :uint32, 1
      optional :bytes, :bytes, 2
      optional :proof, :message, 3, "cosmoverse.proto.tendermint.crypto.Proof"
    end
    add_message "cosmoverse.proto.tendermint.types.BlockID" do
      optional :hash, :bytes, 1
      optional :part_set_header, :message, 2, "cosmoverse.proto.tendermint.types.PartSetHeader"
    end
    add_message "cosmoverse.proto.tendermint.types.Header" do
      optional :version, :message, 1, "cosmoverse.proto.tendermint.version.Consensus"
      optional :chain_id, :string, 2
      optional :height, :int64, 3
      optional :time, :message, 4, "google.protobuf.Timestamp"
      optional :last_block_id, :message, 5, "cosmoverse.proto.tendermint.types.BlockID"
      optional :last_commit_hash, :bytes, 6
      optional :data_hash, :bytes, 7
      optional :validators_hash, :bytes, 8
      optional :next_validators_hash, :bytes, 9
      optional :consensus_hash, :bytes, 10
      optional :app_hash, :bytes, 11
      optional :last_results_hash, :bytes, 12
      optional :evidence_hash, :bytes, 13
      optional :proposer_address, :bytes, 14
    end
    add_message "cosmoverse.proto.tendermint.types.Data" do
      repeated :txs, :bytes, 1
    end
    add_message "cosmoverse.proto.tendermint.types.Vote" do
      optional :type, :enum, 1, "cosmoverse.proto.tendermint.types.SignedMsgType"
      optional :height, :int64, 2
      optional :round, :int32, 3
      optional :block_id, :message, 4, "cosmoverse.proto.tendermint.types.BlockID"
      optional :timestamp, :message, 5, "google.protobuf.Timestamp"
      optional :validator_address, :bytes, 6
      optional :validator_index, :int32, 7
      optional :signature, :bytes, 8
    end
    add_message "cosmoverse.proto.tendermint.types.Commit" do
      optional :height, :int64, 1
      optional :round, :int32, 2
      optional :block_id, :message, 3, "cosmoverse.proto.tendermint.types.BlockID"
      repeated :signatures, :message, 4, "cosmoverse.proto.tendermint.types.CommitSig"
    end
    add_message "cosmoverse.proto.tendermint.types.CommitSig" do
      optional :block_id_flag, :enum, 1, "cosmoverse.proto.tendermint.types.BlockIDFlag"
      optional :validator_address, :bytes, 2
      optional :timestamp, :message, 3, "google.protobuf.Timestamp"
      optional :signature, :bytes, 4
    end
    add_message "cosmoverse.proto.tendermint.types.Proposal" do
      optional :type, :enum, 1, "cosmoverse.proto.tendermint.types.SignedMsgType"
      optional :height, :int64, 2
      optional :round, :int32, 3
      optional :pol_round, :int32, 4
      optional :block_id, :message, 5, "cosmoverse.proto.tendermint.types.BlockID"
      optional :timestamp, :message, 6, "google.protobuf.Timestamp"
      optional :signature, :bytes, 7
    end
    add_message "cosmoverse.proto.tendermint.types.SignedHeader" do
      optional :header, :message, 1, "cosmoverse.proto.tendermint.types.Header"
      optional :commit, :message, 2, "cosmoverse.proto.tendermint.types.Commit"
    end
    add_message "cosmoverse.proto.tendermint.types.LightBlock" do
      optional :signed_header, :message, 1, "cosmoverse.proto.tendermint.types.SignedHeader"
      optional :validator_set, :message, 2, "cosmoverse.proto.tendermint.types.ValidatorSet"
    end
    add_message "cosmoverse.proto.tendermint.types.BlockMeta" do
      optional :block_id, :message, 1, "cosmoverse.proto.tendermint.types.BlockID"
      optional :block_size, :int64, 2
      optional :header, :message, 3, "cosmoverse.proto.tendermint.types.Header"
      optional :num_txs, :int64, 4
    end
    add_message "cosmoverse.proto.tendermint.types.TxProof" do
      optional :root_hash, :bytes, 1
      optional :data, :bytes, 2
      optional :proof, :message, 3, "cosmoverse.proto.tendermint.crypto.Proof"
    end
    add_enum "cosmoverse.proto.tendermint.types.BlockIDFlag" do
      value :BLOCK_ID_FLAG_UNKNOWN, 0
      value :BLOCK_ID_FLAG_ABSENT, 1
      value :BLOCK_ID_FLAG_COMMIT, 2
      value :BLOCK_ID_FLAG_NIL, 3
    end
    add_enum "cosmoverse.proto.tendermint.types.SignedMsgType" do
      value :SIGNED_MSG_TYPE_UNKNOWN, 0
      value :SIGNED_MSG_TYPE_PREVOTE, 1
      value :SIGNED_MSG_TYPE_PRECOMMIT, 2
      value :SIGNED_MSG_TYPE_PROPOSAL, 32
    end
  end
end

module Cosmoverse
  module Proto
    module Tendermint
      module Types
        PartSetHeader = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.PartSetHeader").msgclass
        Part = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.Part").msgclass
        BlockID = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.BlockID").msgclass
        Header = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.Header").msgclass
        Data = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.Data").msgclass
        Vote = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.Vote").msgclass
        Commit = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.Commit").msgclass
        CommitSig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.CommitSig").msgclass
        Proposal = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.Proposal").msgclass
        SignedHeader = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.SignedHeader").msgclass
        LightBlock = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.LightBlock").msgclass
        BlockMeta = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.BlockMeta").msgclass
        TxProof = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.TxProof").msgclass
        BlockIDFlag = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.BlockIDFlag").enummodule
        SignedMsgType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.SignedMsgType").enummodule
      end
    end
  end
end
