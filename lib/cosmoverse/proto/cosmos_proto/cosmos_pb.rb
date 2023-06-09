# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: cosmos_proto/cosmos.proto

require 'google/protobuf'

require 'google/protobuf/descriptor_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("cosmos_proto/cosmos.proto", :syntax => :proto3) do
    add_message "cosmos_proto.InterfaceDescriptor" do
      optional :name, :string, 1, json_name: "name"
      optional :description, :string, 2, json_name: "description"
    end
    add_message "cosmos_proto.ScalarDescriptor" do
      optional :name, :string, 1, json_name: "name"
      optional :description, :string, 2, json_name: "description"
      repeated :field_type, :enum, 3, "cosmos_proto.ScalarType", json_name: "fieldType"
    end
    add_enum "cosmos_proto.ScalarType" do
      value :SCALAR_TYPE_UNSPECIFIED, 0
      value :SCALAR_TYPE_STRING, 1
      value :SCALAR_TYPE_BYTES, 2
    end
  end
end

module Cosmoverse
  module Proto
    module CosmosProto
      InterfaceDescriptor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmos_proto.InterfaceDescriptor").msgclass
      ScalarDescriptor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmos_proto.ScalarDescriptor").msgclass
      ScalarType = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmos_proto.ScalarType").enummodule
    end
  end
end
