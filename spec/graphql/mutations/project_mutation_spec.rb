# frozen_string_literal: true

RSpec.describe Mutations::ProjectMutation do
  describe "creating a new record" do
    let(:args) do
      {
        name: "Some random name",
        description: "Some description"
      }
    end

    it "increases projects by 1" do
      expect(Project.count).to eq 0
      subject.fields["create_project"].resolve(nil, args, nil)
      expect(Project.count).to eq 1
      expect(Project.last.name).to eq "Some random name"
    end
  end

  describe "editing a project" do
    let!(:project) { create(:project, name: "Old name") }

    it "updates a Project" do
      args = {
        id: project.id,
        name: "I am a new project name"
      }

      query_result = subject.fields["edit_project"].resolve(nil, args, nil)

      expect(query_result.name).to eq(args[:name])
      expect(Project.count).to eq 1
    end
  end

  describe "deleting a project" do
    let!(:project1) { create(:project) }
    let!(:project2) { create(:project) }

    it "deletes a project" do
      args = {
        id: project1.id
      }
      query = subject.fields["delete_project"].resolve(nil, args, nil)

      expect(query).not_to include(project1)
    end

    it "reduces the number of projects by one" do
      args = {
        id: project1.id
      }
      subject.fields["delete_project"].resolve(nil, args, nil)

      expect(project.count).to eq 7
    end
  end
end
