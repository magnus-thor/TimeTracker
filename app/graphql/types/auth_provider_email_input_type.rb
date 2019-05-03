# frozen_string_literal: true

module Types
  AuthProviderEmailInputType = GraphQL::InputObjectType.define do
    name "AUTH_PROVIDER_EMAIL"

    argument :email, !types.String
    argument :password, !types.String
  end
end
