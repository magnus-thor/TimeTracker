# frozen_string_literal: true

module Types
  ProjectType = GraphQL::ObjectType.define do
    name "ProjectType"
    description "Type definition for Projects"

    field :id, !types.ID
    field :name, !types.String
    field :description, types.String
  end
end
