# frozen_string_literal: true

RSpec.describe QueryTypes::ProjectQueryType do
  types = GraphQL::Define::TypeDefiner.instance
  let(:projects) { create_list(:project, 5) }
  let(:user) { create(:user) }
  let(:context) { { current_user: user } }

  describe "querying all projects list" do
    it "has a :projects that returns a Project type" do
      expect(subject).to have_field(:projects).that_returns(types[Types::ProjectType])
    end

    it "returns all our created projects lists" do
      query_result = subject.fields["projects"].resolve(nil, nil, context)
      projects.each_with_index do |project, index|
        expect(query_result.to_a).to include(project)

        project.tasks.each do |task|
          expect(query_result.to_a[index].tasks).to include(task)
        end
      end

      expect(query_result.count).to eq(projects.count)
      expect(query_result[0].tasks.count).to eq 3
    end
  end

  describe "querying a specific project" do
    it "returns the queried project" do
      project = projects[0]
      args = { id: project.id }
      query_result = subject.fields["project"].resolve(nil, args, context)

      expect(query_result).to eq project
    end

    it "returns error message if project is not found" do
      args = { id: 100 }
      query_result = subject.fields["project"].resolve(nil, args, context)
      expected_result = GraphQL::ExecutionError.new("No Project with ID 100 found.")
      expect(query_result).to eq expected_result
    end

    it 'returns all the tasks that belong to that project' do
      project = projects[0]
      args = { id: project.id }
      query_result = subject.fields["project"].resolve(nil, args, context)

      expect(query_result.tasks.count).to eq 3
    end
  end
end
