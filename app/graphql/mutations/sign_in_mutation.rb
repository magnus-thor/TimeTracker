# frozen_string_literal: true

module Mutations
  SignInMutation = GraphQL::ObjectType.define do
    name "SignInMutation"
    description "Mutation for user signing in"

    field :sign_in_user do
      argument :email, !Types::AuthProviderEmailInputType

      type Types::AuthenticateType
      resolve ->(_obj, args, _ctx) do
        input = Rails.env.test? ? args[:email] : args[:email].to_params
        return unless input

        user = User.find_by(email: input[:email])
        return unless user
        return unless user.authenticate(input[:password])

        OpenStruct.new(
          token: AuthToken.token(user),
          user: user
        )
      end
    end
  end
end
