# frozen_string_literal: true

module QueryTypes
  ProjectQueryType = GraphQL::ObjectType.define do
    name "ProjectQueryType"
    description "Returns all projects"

    field :projects, types[Types::ProjectType], "returns all projects" do
      resolve ->(_obj, _args, _ctx) { Project.all }
    end

    field :project, Types::ProjectType do
      argument :id, !types.ID
      resolve ->(_obj, args, _ctx) do
        project = Project.find_by(id: args[:id])
        # return {errors: "Project not found"} if project.nil?
        project.nil? ? { errors: "Project not found" } : project
      end
    end
  end
end
