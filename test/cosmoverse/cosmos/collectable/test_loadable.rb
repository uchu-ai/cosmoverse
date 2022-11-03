# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    module Collectable
      class TestLoad < Minitest::Test
        def setup
          @klass = Class.new do
            extend Cosmoverse::Cosmos::Collectable::Loadable
          end
        end

        def test_get_first_page
          pagination = Minitest::Mock.new

          request = Minitest::Mock.new
          request.expect(:pagination=, nil, [pagination])
          request.expect(:order_by=, nil, [:ORDER_BY_ASC])

          request_parameter_class = Struct.new(:request)
          request_parameter = request_parameter_class.new(request)

          response = Minitest::Mock.new

          client = Minitest::Mock.new
          client.expect(:call, response, [request_parameter])

          page_request = lambda { |args|
            assert_equal({ limit: 0, offset: 0 }, args)
            pagination
          }

          Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageRequest.stub :new, page_request do
            Cosmoverse::Cosmos::Client.stub :call, client do
              @klass.stub :new, ->(args) { assert_equal(args, { request_parameter:, response: }) } do
                @klass.get(request_parameter)
              end
            end
          end

          assert_mock request
        end

        def test_get_with_offset_and_limit
          pagination = Minitest::Mock.new

          request = Minitest::Mock.new
          request.expect(:pagination=, nil, [pagination])
          request.expect(:order_by=, nil, [:ORDER_BY_ASC])

          request_parameter_class = Struct.new(:request)
          request_parameter = request_parameter_class.new(request)

          response = Minitest::Mock.new

          client = Minitest::Mock.new
          client.expect(:call, response, [request_parameter])

          page_request = lambda { |args|
            assert_equal({ limit: 3, offset: 5 }, args)
            pagination
          }

          Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageRequest.stub :new, page_request do
            Cosmoverse::Cosmos::Client.stub :call, client do
              @klass.stub :new, ->(args) { assert_equal(args, { request_parameter:, response: }) } do
                @klass.get(request_parameter, limit: 3, offset: 5)
              end
            end
          end

          assert_mock request
        end
      end
    end
  end
end
