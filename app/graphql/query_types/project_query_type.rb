# frozen_string_literal: true

module QueryTypes
  ProjectQueryType = GraphQL::ObjectType.define do
    name "ProjectQueryType"
    description "Returns projects"

    field :projects, types[Types::ProjectType], "returns all projects" do
      resolve ->(_obj, _args, ctx) do
        raise GraphQL::ExecutionError, "Authentication required" if ctx[:current_user].blank?

        Project.all
      end
    end

    field :project, Types::ProjectType do
      argument :id, !types.ID
      resolve ->(_obj, args, ctx) do
                raise GraphQL::ExecutionError, "Authentication required" if ctx[:current_user].blank?

                Project.find(args[:id])

              rescue ActiveRecord::RecordNotFound
                GraphQL::ExecutionError.new("No Project with ID #{args[:id]} found.")
              rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(", ")}")
              end
    end
  end
end
