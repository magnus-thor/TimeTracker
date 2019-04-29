module Types
  TaskType = GraphQL::ObjectType.define do
    name 'TaskType'
    description 'Returning Task objects'

    field :id, !types.ID
    field :title, !types.String
    field :description, !types.String
    field :duration, !types.Float
  end
end
