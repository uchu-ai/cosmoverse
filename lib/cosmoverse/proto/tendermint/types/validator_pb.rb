# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tendermint/types/validator.proto

require "google/protobuf"

require "tendermint/crypto/keys_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tendermint/types/validator.proto", syntax: :proto3) do
    add_message "cosmoverse.proto.tendermint.types.ValidatorSet" do
      repeated :validators, :message, 1, "cosmoverse.proto.tendermint.types.Validator"
      optional :proposer, :message, 2, "cosmoverse.proto.tendermint.types.Validator"
      optional :total_voting_power, :int64, 3
    end
    add_message "cosmoverse.proto.tendermint.types.Validator" do
      optional :address, :bytes, 1
      optional :pub_key, :message, 2, "cosmoverse.proto.tendermint.crypto.PublicKey"
      optional :voting_power, :int64, 3
      optional :proposer_priority, :int64, 4
    end
    add_message "cosmoverse.proto.tendermint.types.SimpleValidator" do
      optional :pub_key, :message, 1, "cosmoverse.proto.tendermint.crypto.PublicKey"
      optional :voting_power, :int64, 2
    end
  end
end

module Cosmoverse
  module Proto
    module Tendermint
      module Types
        ValidatorSet = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.ValidatorSet").msgclass
        Validator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.Validator").msgclass
        SimpleValidator = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.types.SimpleValidator").msgclass
      end
    end
  end
end
