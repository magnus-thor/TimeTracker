# frozen_string_literal: true

RSpec.describe QueryTypes::ProjectQueryType do
  types = GraphQL::Define::TypeDefiner.instance
  let(:projects) { create_list(:project, 5) }

  describe "querying all projects list" do
    it "has a :projects that returns a Project type" do
      expect(subject).to have_field(:projects).that_returns(types[Types::ProjectType])
    end

    it "returns all our created projects lists" do
      query_result = subject.fields["projects"].resolve(nil, nil, nil)

      projects.each do |project|
        expect(query_result.to_a).to include(project)
      end

      expect(query_result.count).to eq(projects.count)
    end
  end
end
