# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "cosmoverse"

require "minitest/autorun"

require "webmock/minitest"
require "byebug"

require_relative "support/gaia_test_helper"

WebMock.disable_net_connect!(allow_localhost: true)
