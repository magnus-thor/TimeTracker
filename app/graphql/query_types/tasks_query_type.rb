module QueryTypes
  TasksQueryType = GraphQL::ObjectType.define do
    name 'TasksQueryType'
    description 'Returns all tasks'

    field :tasks, types[Types::TaskType], 'returns all task lists' do
      resolve ->(_obj, _args, _ctx) { Task.all }
    end
  end
end
