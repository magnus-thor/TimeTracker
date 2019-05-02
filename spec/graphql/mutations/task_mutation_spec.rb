# frozen_string_literal: true

RSpec.describe Mutations::TaskMutation do
  describe "creating a new record" do
    let!(:project) { create(:project) }
    let(:args) do
      {
        title: "Some random title",
        description: "Some description",
        duration: 999,
        project: project.id
      }
    end

    it "increases tasks by 1" do
      expect(Task.count).to eq 3
      subject.fields["create_task"].resolve(nil, args, nil)
      expect(Task.count).to eq 4
      expect(Task.last.title).to eq "Some random title"
    end
  end

  describe "editing a task" do
    let!(:task) { create(:task, title: "Old title") }

    it "updates a task" do
      args = {
        id: task.id,
        title: "I am a new task title"
      }

      query_result = subject.fields["edit_task"].resolve(nil, args, nil)

      expect(query_result.title).to eq(args[:title])
      expect(Task.count).to eq 4
    end
  end

  describe "deleting a task" do
    let!(:task1) { create(:task) }
    let!(:task2) { create(:task) }

    it "deletes a task" do
      args = {
        id: task1.id
      }
      query = subject.fields["delete_task"].resolve(nil, args, nil)

      expect(query).not_to include(task1)
    end

    it "reduces the number of tasks by one" do
      args = {
        id: task1.id
      }
      subject.fields["delete_task"].resolve(nil, args, nil)

      expect(Task.count).to eq 7
    end
  end
end
