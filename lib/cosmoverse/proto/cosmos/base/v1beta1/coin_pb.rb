# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: cosmos/base/v1beta1/coin.proto

require "google/protobuf"

require "cosmoverse/proto/cosmos_proto/cosmos_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("cosmos/base/v1beta1/coin.proto", syntax: :proto3) do
    add_message "cosmoverse.proto.cosmos.base.v1beta1.Coin" do
      optional :denom, :string, 1
      optional :amount, :string, 2
    end
    add_message "cosmoverse.proto.cosmos.base.v1beta1.DecCoin" do
      optional :denom, :string, 1
      optional :amount, :string, 2
    end
    add_message "cosmoverse.proto.cosmos.base.v1beta1.IntProto" do
      optional :int, :string, 1
    end
    add_message "cosmoverse.proto.cosmos.base.v1beta1.DecProto" do
      optional :dec, :string, 1
    end
  end
end

module Cosmoverse
  module Proto
    module Cosmos
      module Base
        module V1beta1
          Coin = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.base.v1beta1.Coin").msgclass
          DecCoin = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.base.v1beta1.DecCoin").msgclass
          IntProto = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.base.v1beta1.IntProto").msgclass
          DecProto = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.base.v1beta1.DecProto").msgclass
        end
      end
    end
  end
end