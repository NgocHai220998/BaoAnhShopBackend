class ProductsEdgeType < GraphQL::Types::Relay::BaseEdge
  node_type Types::ProductType::ProductBase
end

module Types
  module ProductType
    class ProductConnection < GraphQL::Types::Relay::BaseConnection
      field :total_count, Integer, null: false

      def total_count
        if context[:filter].keys[0] == "name"
          Product.where("name LIKE ?", "%#{context[:filter]["name"]}%").size
        else
          Product.where(context[:filter]).size
        end
      end

      edge_type ProductsEdgeType
    end
  end
end
