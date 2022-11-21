# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    module Ibc
      class TestDenomTrace < Minitest::Test
        def test_get
          ibc_denom = "ibc/14F9BC3E44B8A9C1BE1FB08980FAB87034C9905EF17CF2F5008FC085218811CC"

          denom_trace = VCR.use_cassette("denom_trace/cosmos_osmo") do
            Cosmoverse::Cosmos.config.stub :tendermint_host, "https://rpc.cosmos.network" do
              Cosmoverse::Cosmos.config.stub :mode, :http do
                Cosmoverse::Cosmos::Ibc::DenomTrace.get(ibc_denom)
              end
            end
          end

          assert_equal("transfer/channel-141", denom_trace.path)
          assert_equal("uosmo", denom_trace.base_denom)
        end

        def test_page
          denom_trace_page = Cosmoverse::Cosmos.config.stub :tendermint_host, "https://rpc.cosmos.network" do
            Cosmoverse::Cosmos.config.stub :mode, :http do
              Cosmoverse::Cosmos::Ibc::DenomTrace.page
            end
          end

          assert_instance_of(Cosmoverse::Cosmos::Ibc::DenomTrace::Collection, denom_trace_page)
          assert_instance_of(Cosmoverse::Cosmos::Ibc::DenomTrace, denom_trace_page.first)
        end
      end
    end
  end
end
