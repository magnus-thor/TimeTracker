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

      expect(query_result.count).to eq(tasks.count)
    end
  end
end
