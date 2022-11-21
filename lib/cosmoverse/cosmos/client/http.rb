# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    module Client
      class Http < Base
        def call
          response = Net::HTTP.get_response(uri)

          raise "Request was not successful #{response}" unless response.is_a?(Net::HTTPSuccess)

          rpc_response = JSON.parse(response.body)

          raise "RPC response was not successful #{rpc_response}" unless rpc_response.key?("result")

          value = Base64.decode64(rpc_response.fetch("result").fetch("response").fetch("value"))
          response_class.decode(value)
        end

        private

        def uri
          URI("#{Cosmoverse::Cosmos.config.tendermint_host}/abci_query").tap do |base_uri|
            base_uri.query = URI.encode_www_form(params)
          end
        end

        def http_proto = request.to_proto.gsub("\n", '\n')

        def path = "/#{service_class.service_name}/#{capitalized_request_method}"

        def capitalized_request_method = request_method.to_s.split("_").map(&:capitalize).join

        def params
          # HACK: Empty proto requests cause errors. Data is not added in that
          # case.
          return { path: "\"#{path}\"" } if http_proto == "\\n\x00"

          { path: "\"#{path}\"", data: "\"#{http_proto}\"" }
        end
      end
    end
  end
end
