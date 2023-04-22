# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "cosmoverse"

require "minitest/autorun"

require "byebug"

require_relative "support/gaia_test_helper"
require_relative "support/tendermint_test_helper"
