module Queries
  module ProductQuery
    class FetchProducts < Queries::BaseQuery
      type Types::ProductType::ProductConnection, null: false
      argument :limit, Integer, required: true, default_value: 1
      argument :page, Integer, required: true, default_value: 1
      argument :filter, String, required: true, default_value: "{}"

      extras [:lookahead]

      def resolve(lookahead:, limit:, page:, filter:) scope = if JSON.parse(filter).keys[0] == "name"
          Product.where("name LIKE ?", "%#{JSON.parse(filter)["name"]}%").limit(limit).offset((page - 1) * limit)
        else
          Product.where(JSON.parse(filter)).limit(limit).offset((page - 1) * limit)
        end
        context[:filter] = JSON.parse filter
        return scope unless lookahead.selection(:edges).selection(:node).selects? :examples
 # scope.includes :examples
              end
    end
  end
end
