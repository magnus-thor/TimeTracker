# frozen_string_literal: true

module Mutations
  TaskMutation = GraphQL::ObjectType.define do
    name "TaskMutation"
    description "Mutations for task"

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

    field :edit_task, Types::TaskType do
      argument :id, !types.ID
      argument :title, types.String
      argument :description, types.String
      argument :duration, types.Int
      argument :project, types.ID

      resolve ->(_obj, args, _ctx) do
        task = Task.find(args[:id])

        if Rails.env.test?
          task.update(
            args
          )
        else
          task.update(
            args.to_params
          )
        end
        task
      end
    end

    field :delete_task, types[Types::TaskType] do
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) do
        task = Task.find(args[:id])
        task.destroy
        Task.all
      end
    end
  end
end
