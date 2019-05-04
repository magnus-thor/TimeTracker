# frozen_string_literal: true

RSpec.describe QueryTypes::TaskQueryType do
  types = GraphQL::Define::TypeDefiner.instance
  let(:tasks) { create_list(:task, 3) }

  describe "querying all tasks list" do
    it "has a :tasks that returns a Task type" do
      expect(subject).to have_field(:tasks).that_returns(types[Types::TaskType])
    end

    it "returns all our created tasks lists" do
      query_result = subject.fields["tasks"].resolve(nil, nil, nil)

      tasks.each do |list|
        expect(query_result.to_a).to include(list)
      end

      expect(query_result.count).to eq(12)
    end
  end

  describe "querying a specific task" do
    it "returns the queried task" do
      task = tasks[0]
      args = { id: task.id }
      query_result = subject.fields["task"].resolve(nil, args, nil)

      expect(query_result).to eq task
    end

    it "returns error message if task is not found" do
      args = { id: 100 }
      query_result = subject.fields["task"].resolve(nil, args, nil)
      expected_result = GraphQL::ExecutionError.new("No Task with ID 100 found.")
      expect(query_result).to eq expected_result
    end
  end
end
