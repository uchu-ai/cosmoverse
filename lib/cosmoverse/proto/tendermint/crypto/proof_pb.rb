# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tendermint/crypto/proof.proto

require 'google/protobuf'

require 'cosmoverse/proto/gogoproto/gogo_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("tendermint/crypto/proof.proto", :syntax => :proto3) do
    add_message "tendermint.crypto.Proof" do
      optional :total, :int64, 1, json_name: "total"
      optional :index, :int64, 2, json_name: "index"
      optional :leaf_hash, :bytes, 3, json_name: "leafHash"
      repeated :aunts, :bytes, 4, json_name: "aunts"
    end
    add_message "tendermint.crypto.ValueOp" do
      optional :key, :bytes, 1, json_name: "key"
      optional :proof, :message, 2, "tendermint.crypto.Proof", json_name: "proof"
    end
    add_message "tendermint.crypto.DominoOp" do
      optional :key, :string, 1, json_name: "key"
      optional :input, :string, 2, json_name: "input"
      optional :output, :string, 3, json_name: "output"
    end
    add_message "tendermint.crypto.ProofOp" do
      optional :type, :string, 1, json_name: "type"
      optional :key, :bytes, 2, json_name: "key"
      optional :data, :bytes, 3, json_name: "data"
    end
    add_message "tendermint.crypto.ProofOps" do
      repeated :ops, :message, 1, "tendermint.crypto.ProofOp", json_name: "ops"
    end
  end
end

module Cosmoverse
  module Proto
    module Tendermint
      module Crypto
        module Proof
          Proof = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tendermint.crypto.Proof").msgclass
          ValueOp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tendermint.crypto.ValueOp").msgclass
          DominoOp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tendermint.crypto.DominoOp").msgclass
          ProofOp = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tendermint.crypto.ProofOp").msgclass
          ProofOps = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("tendermint.crypto.ProofOps").msgclass
        end
      end
    end
  end
end
