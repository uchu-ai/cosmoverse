# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    module Collectable
      module Loadable
        def get(request_parameter, limit: 0, offset: 0)
          request_parameter.request.pagination =
            Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageRequest.new(limit:, offset:)
          request_parameter.request.order_by = :ORDER_BY_ASC
          response = Cosmoverse::Cosmos::Client.call(request_parameter)
          new(request_parameter:, response:)
        end
      end

      include Enumerable

      def initialize(request_parameter:, response:)
        @request_parameter = request_parameter
        @response = response
      end

      def each(&)
        if block_given?
          records.each(&)
        else
          to_enum(:each)
        end
      end

      def limit = request_parameter.request.pagination.limit
      def offset = request_parameter.request.pagination.offset
      def total = response.pagination.total
      def next_offset = offset + records.count
      def next_page? = next_offset < total

      def next_page
        return unless next_page?

        self.class.get(request_parameter, limit:, offset: next_offset)
      end

      def records
        raise NotImplementedError, "#records has to be implemented"
      end

      attr_reader :request_parameter, :response
      private :request_parameter, :response, :records
    end
  end
end
