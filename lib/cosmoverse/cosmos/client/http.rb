# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    module Client
      class Http
        def self.call(request)
          new(request).call
        end

        def initialize(request)
          @request = request
        end

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

        def http_proto
          request.to_proto.gsub("\n", '\n')
        end

        def params
          {
            path: "\"#{path}\"",
            data: "\"#{http_proto}\""
          }
        end

        def path
          "/#{service_name}/#{request_method}"
        end

        def service_name
          names = request.class.name.split("::")
          names[-1] = names[-1].split(/(?=[A-Z])/).first
          Object.const_get("#{names.join("::")}::Service").service_name
        end

        def response_class
          Object.const_get(request.class.name.sub(/Request\z/, "Response"))
        end

        def request_method
          request.class.name.split("::").last.split(/(?=[A-Z])/)[1..-2].join
        end

        attr_reader :request
      end
    end
  end
end
