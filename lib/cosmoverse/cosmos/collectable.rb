# frozen_string_literal: true

module Cosmoverse
  module Cosmos
    module Collectable
      include Enumerable

      attr_reader :limit, :offset, :request, :response

      def initialize(request, limit: 0, offset: 0)
        request.pagination =
          Cosmoverse::Proto::Cosmos::Base::Query::V1beta1::Pagination::PageRequest.new(limit:, offset:)
        request.order_by = :ORDER_BY_ASC

        @request = request
        @limit = limit
        @offset = offset
        @response = Cosmoverse::Cosmos::Client.call(request)
      end

      def each(&)
        if block_given?
          records.each(&)
        else
          to_enum(:each)
        end
      end

      def next_offset = offset + records.count

      def next_page
        self.class.new(request, limit:, offset: next_offset)
      end

      def records
        raise NotImplementedError, "#records has to be implemented"
      end

      private :request, :response, :records
    end
  end
end
