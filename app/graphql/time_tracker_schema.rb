# frozen_string_literal: true

class TimeTrackerSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
