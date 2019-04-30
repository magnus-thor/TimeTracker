# frozen_string_literal: true

module QueryTypes
  TaskQueryType = GraphQL::ObjectType.define do
    name "TaskQueryType"
    description "Returns all tasks"

    field :tasks, types[Types::TaskType], "returns all task" do
      resolve ->(_obj, _args, _ctx) { Task.all }
    end
  end
end
