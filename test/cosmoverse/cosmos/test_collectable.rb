# frozen_string_literal: true

require "test_helper"

module Cosmoverse
  module Cosmos
    class TestCollectable < Minitest::Test
      def setup
        @klass = Class.new do
          include Cosmoverse::Cosmos::Collectable

          private

          def records
            response.records
          end
        end

        @records = %i[a b c]

        @request = Minitest::Mock.new
        @request.expect(:pagination=, nil, [Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageRequest])
        @request.expect(:order_by=, nil, [:ORDER_BY_ASC])

        @response = Minitest::Mock.new
        @response.expect(:records, @records)

        @client = Minitest::Mock.new
        @client.expect(:call, @response, [@request])
      end

      def test_stub_verification
        Cosmoverse::Cosmos::Client.stub :call, @client do
          @klass.new(@request).any?
        end

        assert_mock @request
        assert_mock @response
        assert_mock @client
      end

      def test_records
        Cosmoverse::Cosmos::Client.stub :call, @client do
          assert_equal @klass.new(@request).to_a, @records
        end
      end

      def test_next_offset_on_first_request
        Cosmoverse::Cosmos::Client.stub :call, @client do
          assert_equal(3, @klass.new(@request).next_offset)
        end
      end

      def test_next_offset_with_existing_offset
        Cosmoverse::Cosmos::Client.stub :call, @client do
          assert_equal(8, @klass.new(@request, offset: 5).next_offset)
        end
      end

      def test_next_page
        next_page_collection = ->(*args) { assert_equal(args, [@request, { limit: 5, offset: 6 }]) }

        Cosmoverse::Cosmos::Client.stub :call, @client do
          collection = @klass.new(@request, offset: 3, limit: 5)

          @klass.stub :new, next_page_collection do
            collection.next_page
          end
        end
      end
    end
  end
end
