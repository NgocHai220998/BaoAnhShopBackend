module Types
  module Base
    class BaseObject < GraphQL::Schema::Object
      field_class Types::Base::BaseField
    end
  end
end
