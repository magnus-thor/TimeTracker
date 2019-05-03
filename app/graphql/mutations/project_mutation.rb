# frozen_string_literal: true

module Mutations
  ProjectMutation = GraphQL::ObjectType.define do
    name "ProjectMutation"
    description "Mutations for Projects"

    field :create_project, Types::ProjectType do
      argument :name, !types.String
      argument :description, !types.String

      resolve ->(_obj, args, _ctx) do
        Project.create(name: args[:name], description: args[:description])
      end
    end

    field :edit_project, Types::ProjectType do
      argument :id, !types.ID
      argument :name, types.String
      argument :description, types.String

      resolve ->(_obj, args, _ctx) do
        project = Project.find(args[:id])

        args = args.to_params unless Rails.env.test?
        project.update(
          args
        )

        project
      end
    end

    field :delete_project, Types::ProjectType do
      argument :id, types.ID

      resolve ->(_obj, args, _ctx) do
        Project.destroy(args[:id])
      end
    end
  end
end
