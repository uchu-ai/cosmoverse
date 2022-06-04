# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tendermint/crypto/keys.proto

require "google/protobuf"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tendermint/crypto/keys.proto", syntax: :proto3) do
    add_message "cosmoverse.proto.tendermint.crypto.PublicKey" do
      oneof :sum do
        optional :ed25519, :bytes, 1
        optional :secp256k1, :bytes, 2
      end
    end
  end
end

module Cosmoverse
  module Proto
    module Tendermint
      module Crypto
        PublicKey = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.tendermint.crypto.PublicKey").msgclass
      end
    end
  end
end
