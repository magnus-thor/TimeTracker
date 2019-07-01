# frozen_string_literal: true

module QueryTypes
  UserQueryType = GraphQL::ObjectType.define do
    name "UserQueryType"
    description "Returns users"

    field :users, types[Types::UserType], "returns all users" do
      resolve ->(_obj, _args, ctx) do
        raise GraphQL::ExecutionError, "Authentication required" if ctx[:current_user].blank?

        User.all
      end
    end

    field :user, Types::UserType do
      argument :id, !types.ID
      resolve ->(_obj, args, ctx) do
              return GraphQL::ExecutionError.new("Authentication required") if ctx.nil? || ctx[:current_user].nil?

              user = User.find(args[:id])
              user
              rescue ActiveRecord::RecordNotFound
                GraphQL::ExecutionError.new("No user with ID #{args[:id]} found.")
              rescue ActiveRecord::RecordInvalid => e
                GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(", ")}")
              end
    end
  end
end
