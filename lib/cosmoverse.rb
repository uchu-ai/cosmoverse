# frozen_string_literal: true

require "uri"
require "net/http"
require "base64"
require "json"
require "time"

require "cosmoverse/version"
require "cosmoverse/cosmos"

module Cosmoverse
  class Error < StandardError; end
end
