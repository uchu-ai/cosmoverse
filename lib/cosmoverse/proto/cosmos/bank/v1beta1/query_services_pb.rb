# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: cosmos/bank/v1beta1/query.proto for package 'cosmoverse.proto.cosmos.bank.v1beta1'

require "grpc"
require "cosmoverse/proto/cosmos/bank/v1beta1/query_pb"

module Cosmoverse
  module Proto
    module Cosmos
      module Bank
        module V1beta1
          module Query
            # Query defines the gRPC querier service.
            class Service
              include ::GRPC::GenericService

              self.marshal_class_method = :encode
              self.unmarshal_class_method = :decode
              self.service_name = "cosmos.bank.v1beta1.Query"

              # Balance queries the balance of a single coin for a single account.
              rpc :Balance, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryBalanceRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryBalanceResponse
              # AllBalances queries the balance of all coins for a single account.
              rpc :AllBalances, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryAllBalancesRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryAllBalancesResponse
              # SpendableBalances queries the spenable balance of all coins for a single
              # account.
              #
              # Since: cosmos-sdk 0.46
              rpc :SpendableBalances, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QuerySpendableBalancesRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QuerySpendableBalancesResponse
              # TotalSupply queries the total supply of all coins.
              rpc :TotalSupply, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryTotalSupplyRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryTotalSupplyResponse
              # SupplyOf queries the supply of a single coin.
              rpc :SupplyOf, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QuerySupplyOfRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QuerySupplyOfResponse
              # Params queries the parameters of x/bank module.
              rpc :Params, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryParamsRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryParamsResponse
              # DenomsMetadata queries the client metadata of a given coin denomination.
              rpc :DenomMetadata, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryDenomMetadataRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryDenomMetadataResponse
              # DenomsMetadata queries the client metadata for all registered coin
              # denominations.
              rpc :DenomsMetadata, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryDenomsMetadataRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryDenomsMetadataResponse
              # DenomOwners queries for all account addresses that own a particular token
              # denomination.
              #
              # Since: cosmos-sdk 0.46
              rpc :DenomOwners, ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryDenomOwnersRequest,
                  ::Cosmoverse::Proto::Cosmos::Bank::V1beta1::QueryDenomOwnersResponse
            end

            Stub = Service.rpc_stub_class
          end
        end
      end
    end
  end
end
