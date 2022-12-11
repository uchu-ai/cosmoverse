# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    module Client
      class Http < Base
        def call
          response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: ssl?) { |http| http.request(http_request) }
          rpc_response = JSON.parse(response.body)
          value = Base64.decode64(rpc_response.fetch("result").fetch("response").fetch("value"))
          response_class.decode(value)
        end

        private

        def ssl? = uri.scheme == "https"

        def uri = URI(Cosmoverse::Cosmos.config.tendermint_host)

        def path = "/#{service_class.service_name}/#{capitalized_request_method}"

        def capitalized_request_method = request_method.to_s.split("_").map(&:capitalize).join

        def http_request
          Net::HTTP::Post.new(uri, "Content-Type" => "application/json").tap do |post|
            post.body = json_rpc_params.to_json
          end
        end

        def json_rpc_params = { id: -1, jsonrpc: "2.0", method: "abci_query", params: }

        def params = { path:, data: request.to_proto.unpack1("H*") }
      end
    end
  end
end
