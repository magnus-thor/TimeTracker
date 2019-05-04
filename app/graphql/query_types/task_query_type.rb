# frozen_string_literal: true

module QueryTypes
  TaskQueryType = GraphQL::ObjectType.define do
    name "TaskQueryType"
    description "Returns tasks"

    field :tasks, types[Types::TaskType], "returns all task" do
      resolve ->(_obj, _args, _ctx) { Task.all }
    end

    field :task, Types::TaskType do
      argument :id, !types.ID
      resolve ->(_obj, args, _ctx) do
                task = Task.find(args[:id])
                task
              rescue ActiveRecord::RecordNotFound
                GraphQL::ExecutionError.new("No Task with ID #{args[:id]} found.")
              rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(", ")}")
              end
    end
  end
end
