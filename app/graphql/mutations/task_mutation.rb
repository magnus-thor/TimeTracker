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

    field :edit_task, Types::TaskType do
      argument :id, !types.ID
      argument :title, types.String
      argument :description, types.String
      argument :duration, types.Int
      argument :project, types.ID

      resolve -> (_obj, args, _ctx) do
        task = Task.find(args[:id])

        if args.key?(:title)
          task.update(
            title: args[:title]
          )
        end
        if args.key?(:description)
          task.update(
            description: args[:description]
          )
        end
        if args.key?(:duration)
          task.update(
            duration: args[:duration]
          )
        end
        if args.key?(:project)
          project = Project.find(args[:project])
          task.update(
            project: project
          )
        end
        
        task
      end
    end
  end
end
