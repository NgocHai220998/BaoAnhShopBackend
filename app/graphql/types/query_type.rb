module Types
  class QueryType < Types::Base::BaseObject
    field :fetch_products, resolver: Queries::ProductQuery::FetchProducts
    field :fetch_product, resolver: Queries::ProductQuery::FetchProduct
  end
end
  