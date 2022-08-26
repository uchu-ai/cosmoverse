# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: cosmos_proto/cosmos.proto

require "google/protobuf"

require "google/protobuf/descriptor_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("cosmos_proto/cosmos.proto", syntax: :proto3) do
    add_message "cosmoverse.proto.cosmos_proto.InterfaceDescriptor" do
      optional :name, :string, 1
      optional :description, :string, 2
    end
    add_message "cosmoverse.proto.cosmos_proto.ScalarDescriptor" do
      optional :name, :string, 1
      optional :description, :string, 2
      repeated :field_type, :enum, 3, "cosmoverse.proto.cosmos_proto.ScalarType"
    end
    add_enum "cosmoverse.proto.cosmos_proto.ScalarType" do
      value :SCALAR_TYPE_UNSPECIFIED, 0
      value :SCALAR_TYPE_STRING, 1
      value :SCALAR_TYPE_BYTES, 2
    end
  end
end

module Cosmoverse
  module Proto
    module CosmosProto
      InterfaceDescriptor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos_proto.InterfaceDescriptor").msgclass
      ScalarDescriptor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos_proto.ScalarDescriptor").msgclass
      ScalarType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos_proto.ScalarType").enummodule
    end
  end
end