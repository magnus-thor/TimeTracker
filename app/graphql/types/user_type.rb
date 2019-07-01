# frozen_string_literal: true

module Types
  UserType = GraphQL::ObjectType.define do
    name "UserType"

    field :id, !types.ID
    field :email, !types.String
    field :first_name, !types.String
    field :last_name, !types.String

    field :tasks, !types[Types::TaskType] do
      # preload :tasks
      resolve -> (obj, args, ctx) { obj.tasks }
    end
    field :projects, !types[Types::ProjectType] do
      # preload :projects
      resolve -> (obj, args, ctx) { obj.projects }
    end
  end
end
