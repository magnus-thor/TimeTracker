# frozen_string_literal: true

module Types
  TaskType = GraphQL::ObjectType.define do
    name "TaskType"
    description "Returning Task types"

    field :id, !types.ID
    field :title, !types.String
    field :description, !types.String
    field :duration, !types.Int
    field :project do
      type ProjectType
      resolve ->(obj, _args, _ctx) { obj.project }
    end
  end
end
