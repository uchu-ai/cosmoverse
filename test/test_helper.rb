# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "cosmoverse"

require "minitest/autorun"

require "webmock/minitest"
require "byebug"
require "vcr"

require_relative "support/gaia_test_helper"

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
end

VCR.turn_off!(ignore_cassettes: true) if ENV["CI"]

WebMock.disable_net_connect!(allow_localhost: true, allow: "rpc.cosmos.network")
