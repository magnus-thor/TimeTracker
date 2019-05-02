# frozen_string_literal: true

module QueryTypes
  TaskQueryType = GraphQL::ObjectType.define do
    name "TaskQueryType"
    description "Returns all tasks"

    field :tasks, types[Types::TaskType], "returns all task" do
      resolve ->(_obj, _args, _ctx) { Task.all }
    end

    field :task, Types::TaskType do
      argument :id, !types.ID
      resolve ->(_obj, args, _ctx) do
        task = Task.find_by(id: args[:id])
        task.nil? ? { errors: "Task not found" } : task
      end
    end
  end
end
