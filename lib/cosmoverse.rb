# frozen_string_literal: true

require "uri"
require "net/http"
require "base64"
require "json"

require_relative "cosmoverse/version"
require_relative "cosmoverse/cosmos"

module Cosmoverse
  class Error < StandardError; end
end
