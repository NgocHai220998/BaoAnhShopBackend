module Types
  module ProductType
    class ProductBase < Types::Base::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :distributor, String, null: false
      field :image, String, null: false
      field :price, Integer, null: true
      field :discount, Float, null: true
      # field :info_more, String, null: true
      # field :explain_vi, String, null: true
      # field :explain_voca, String, null: true
      # field :image, String, null: true

      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end
end
