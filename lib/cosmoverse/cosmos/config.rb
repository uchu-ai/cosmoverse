# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    class << self
      def configure
        yield config
      end

      def config
        @config ||= Config.new
      end
    end

    class Config
      attr_accessor :mode, :tendermint_host, :grpc_host, :grpc_port

      def initialize
        @mode            = :grpc
        @tendermint_host = "http://localhost:26657"
        @grpc_host       = "127.0.0.1"
        @grpc_port       = "9090"
      end
    end
  end
end
