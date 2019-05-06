# frozen_string_literal: true

RSpec.describe QueryTypes::UserQueryType do
  types = GraphQL::Define::TypeDefiner.instance
  let(:users) { create_list(:user, 3) }
  let(:context) { { current_user: users[0] } }

  describe "querying all users" do
    it "has a :users that returns a user type" do
      expect(subject).to have_field(:users).that_returns(types[Types::UserType])
    end

    it "returns all users" do
      query_result = subject.fields["users"].resolve(nil, nil, context)

      users.each do |user|
        expect(query_result.to_a).to include(user)
      end

      expect(query_result.count).to eq(3)
    end
  end

  describe "querying a specific user" do
    it "returns the queried task" do
      user = users[1]
      args = { id: user.id }
      query_result = subject.fields["user"].resolve(nil, args, context)

      expect(query_result).to eq user
    end

    it "returns error message if task is not found" do
      args = { id: 100 }
      query_result = subject.fields["user"].resolve(nil, args, context)
      expected_result = GraphQL::ExecutionError.new("No user with ID 100 found.")
      expect(query_result).to eq expected_result
    end

    it "returns error message if user is not logged in" do
      args = { id: 100 }
      query_result = subject.fields["user"].resolve(nil, args, current_user: nil)
      expected_result = GraphQL::ExecutionError.new("Authentication required")
      expect(query_result).to eq expected_result
    end
  end
end
