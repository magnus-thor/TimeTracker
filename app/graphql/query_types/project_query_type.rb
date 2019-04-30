# frozen_string_literal: true

module QueryTypes
  ProjectQueryType = GraphQL::ObjectType.define do
    name "ProjectQueryType"
    description "Returns all projects"

    field :projects, types[Types::ProjectType], "returns all projects" do
      resolve ->(_obj, _args, _ctx) { Project.all }
    end
  end
end
