# frozen_string_literal: true

module Types
  QueryType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = "Query"
    root_type.description = "The query root"
    root_type.interfaces = []
    root_type.fields = Util::FieldCombiner.combine([
      QueryTypes::TaskQueryType,
      QueryTypes::ProjectQueryType,
      QueryTypes::UserQueryType
    ])
  end
end
