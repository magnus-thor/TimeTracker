# frozen_string_literal: true

module Mutations
  TaskMutation = GraphQL::ObjectType.define do
    name "TaskMutation"
    description "Mutation type for task"

    field :create_task, Types::TaskType do
      argument :title, !types.String
      argument :description, !types.String
      argument :duration, !types.Int
      argument :project, !types.ID

      resolve ->(_obj, args, _ctx) do
        project = Project.find(args[:project])
        Task.create(
          title: args[:title],
          description: args[:description],
          duration: args[:duration],
          project: project
        )
      end
    end
  end
end
