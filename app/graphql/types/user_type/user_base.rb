module Types
  module UserType
    class UserBase < Types::Base::BaseObject
      field :id, ID, null: false do
        description "This's id of user"
      end
      field :encrypted_password, String, null: false
      field :reset_password_token, String, null: true
      field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
      field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :created_at, GraphQL::Types::ISO8601DateTime, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
      field :email, String, null: true
    end
  end
end
