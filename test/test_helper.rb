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
  config.default_cassette_options = { re_record_interval: 518_400 }
  config.allow_http_connections_when_no_cassette = true
end

WebMock.disable_net_connect!(allow_localhost: true)
