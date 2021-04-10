module Queries
  module ProductQuery
    class FetchProduct < Queries::BaseQuery
      type [Types::ProductType::ProductBase], null: false
      argument :name, String, required: true

      def resolve name:
        Product.where("name LIKE ?", "%#{name}%")
      rescue ActiveRecord::RecordNotFound => _e
        GraphQL::ExecutionError.new "Product does not exist."
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
