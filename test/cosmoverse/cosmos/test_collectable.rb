# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestCollectable < Minitest::Test
      def setup
        @klass = Class.new do
          include Cosmoverse::Cosmos::Collectable

          def self.get = nil

          def records
            response.records
          end
        end
      end

      def test_records
        records = %i[a b c]

        response = Minitest::Mock.new
        request_parameter = Minitest::Mock.new

        response.expect(:records, records)

        assert_equal @klass.new(request_parameter:, response:).to_a, records
      end

      def test_next_offset
        records = %i[a b c d]

        request = Minitest::Mock.new
        request_parameter = Minitest::Mock.new
        response = Minitest::Mock.new

        request.expect(:pagination,
                       Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageRequest.new(offset: 3))
        request_parameter.expect(:request, request)
        response.expect(:records, records)

        assert_equal(7, @klass.new(request_parameter:, response:).next_offset)
      end

      def test_next_page
        records = %i[a b c]
        request_pagination = Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageRequest.new(limit: 2,
                                                                                                          offset: 5)
        response_pagination = Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageResponse.new(total: 10)

        response = Minitest::Mock.new
        request_parameter = Minitest::Mock.new
        request = Minitest::Mock.new

        3.times { response.expect(:records, records) }
        4.times { request_parameter.expect(:request, request) }
        4.times { request.expect(:pagination, request_pagination) }
        2.times { response.expect(:pagination, response_pagination) }

        next_page_collection = ->(*args) { assert_equal(args, [request_parameter, { limit: 2, offset: 8 }]) }

        collection = @klass.new(request_parameter:, response:)

        assert_predicate collection, :next_page?

        @klass.stub :get, next_page_collection do
          collection.next_page
        end

        assert_mock request
        assert_mock response
        assert_mock request_parameter
      end

      def test_next_page_when_unavailable
        records = %i[a b c]
        request_pagination = Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageRequest.new(limit: 2,
                                                                                                          offset: 5)
        response_pagination = Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageResponse.new(total: 7)

        response = Minitest::Mock.new
        request_parameter = Minitest::Mock.new
        request = Minitest::Mock.new

        2.times { response.expect(:records, records) }
        2.times { request_parameter.expect(:request, request) }
        2.times { request.expect(:pagination, request_pagination) }
        2.times { response.expect(:pagination, response_pagination) }

        collection = @klass.new(request_parameter:, response:)

        refute_predicate collection, :next_page?
        assert_nil collection.next_page

        assert_mock request
        assert_mock response
        assert_mock request_parameter
      end
    end
  end
end
