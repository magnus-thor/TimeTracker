# frozen_string_literal: true

module Types
  ProjectType = GraphQL::ObjectType.define do
    name "ProjectType"
    description "Type definition for Projects"

    field :id, !types.ID
    field :name, !types.String
    field :description, types.String

    field :tasks, types[Types::TaskType] do
      resolve ->(obj, _args, _ctx) { obj.task }
    end
  end
end
