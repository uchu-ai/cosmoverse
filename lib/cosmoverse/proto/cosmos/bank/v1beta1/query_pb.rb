# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: cosmos/bank/v1beta1/query.proto

require "google/protobuf"

require "cosmoverse/proto/cosmos/base/query/v1beta1/pagination_pb"
require "google/api/annotations_pb"
require "cosmoverse/proto/cosmos/base/v1beta1/coin_pb"
require "cosmoverse/proto/cosmos/bank/v1beta1/bank_pb"
require "cosmoverse/proto/cosmos_proto/cosmos_pb"

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("cosmos/bank/v1beta1/query.proto", syntax: :proto3) do
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryBalanceRequest" do
      optional :address, :string, 1
      optional :denom, :string, 2
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryBalanceResponse" do
      optional :balance, :message, 1, "cosmoverse.proto.cosmos.base.v1beta1.Coin"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryAllBalancesRequest" do
      optional :address, :string, 1
      optional :pagination, :message, 2, "cosmoverse.proto.cosmos.base.query.v1beta1.PageRequest"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryAllBalancesResponse" do
      repeated :balances, :message, 1, "cosmoverse.proto.cosmos.base.v1beta1.Coin"
      optional :pagination, :message, 2, "cosmoverse.proto.cosmos.base.query.v1beta1.PageResponse"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QuerySpendableBalancesRequest" do
      optional :address, :string, 1
      optional :pagination, :message, 2, "cosmoverse.proto.cosmos.base.query.v1beta1.PageRequest"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QuerySpendableBalancesResponse" do
      repeated :balances, :message, 1, "cosmoverse.proto.cosmos.base.v1beta1.Coin"
      optional :pagination, :message, 2, "cosmoverse.proto.cosmos.base.query.v1beta1.PageResponse"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryTotalSupplyRequest" do
      optional :pagination, :message, 1, "cosmoverse.proto.cosmos.base.query.v1beta1.PageRequest"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryTotalSupplyResponse" do
      repeated :supply, :message, 1, "cosmoverse.proto.cosmos.base.v1beta1.Coin"
      optional :pagination, :message, 2, "cosmoverse.proto.cosmos.base.query.v1beta1.PageResponse"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QuerySupplyOfRequest" do
      optional :denom, :string, 1
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QuerySupplyOfResponse" do
      optional :amount, :message, 1, "cosmoverse.proto.cosmos.base.v1beta1.Coin"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryParamsRequest" do
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryParamsResponse" do
      optional :params, :message, 1, "cosmoverse.proto.cosmos.bank.v1beta1.Params"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomsMetadataRequest" do
      optional :pagination, :message, 1, "cosmoverse.proto.cosmos.base.query.v1beta1.PageRequest"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomsMetadataResponse" do
      repeated :metadatas, :message, 1, "cosmoverse.proto.cosmos.bank.v1beta1.Metadata"
      optional :pagination, :message, 2, "cosmoverse.proto.cosmos.base.query.v1beta1.PageResponse"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomMetadataRequest" do
      optional :denom, :string, 1
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomMetadataResponse" do
      optional :metadata, :message, 1, "cosmoverse.proto.cosmos.bank.v1beta1.Metadata"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomOwnersRequest" do
      optional :denom, :string, 1
      optional :pagination, :message, 2, "cosmoverse.proto.cosmos.base.query.v1beta1.PageRequest"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.DenomOwner" do
      optional :address, :string, 1
      optional :balance, :message, 2, "cosmoverse.proto.cosmos.base.v1beta1.Coin"
    end
    add_message "cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomOwnersResponse" do
      repeated :denom_owners, :message, 1, "cosmoverse.proto.cosmos.bank.v1beta1.DenomOwner"
      optional :pagination, :message, 2, "cosmoverse.proto.cosmos.base.query.v1beta1.PageResponse"
    end
  end
end

module Cosmoverse
  module Proto
    module Cosmos
      module Bank
        module V1beta1
          QueryBalanceRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryBalanceRequest").msgclass
          QueryBalanceResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryBalanceResponse").msgclass
          QueryAllBalancesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryAllBalancesRequest").msgclass
          QueryAllBalancesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryAllBalancesResponse").msgclass
          QuerySpendableBalancesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QuerySpendableBalancesRequest").msgclass
          QuerySpendableBalancesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QuerySpendableBalancesResponse").msgclass
          QueryTotalSupplyRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryTotalSupplyRequest").msgclass
          QueryTotalSupplyResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryTotalSupplyResponse").msgclass
          QuerySupplyOfRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QuerySupplyOfRequest").msgclass
          QuerySupplyOfResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QuerySupplyOfResponse").msgclass
          QueryParamsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryParamsRequest").msgclass
          QueryParamsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryParamsResponse").msgclass
          QueryDenomsMetadataRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomsMetadataRequest").msgclass
          QueryDenomsMetadataResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomsMetadataResponse").msgclass
          QueryDenomMetadataRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomMetadataRequest").msgclass
          QueryDenomMetadataResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomMetadataResponse").msgclass
          QueryDenomOwnersRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomOwnersRequest").msgclass
          DenomOwner = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.DenomOwner").msgclass
          QueryDenomOwnersResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("cosmoverse.proto.cosmos.bank.v1beta1.QueryDenomOwnersResponse").msgclass
        end
      end
    end
  end
end