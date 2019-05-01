# frozen_string_literal: true

RSpec.describe Mutations::TaskMutation do
  describe "creating a new record" do
    let!(:project) { create(:project) }
    let(:args) do
      {
        title: "Some random title",
        description: "Some description",
        duration: 999,
        project: project
      }
    end

    it "increases tasks by 1" do
      expect(Task.count).to eq 3
      subject.fields["create_task"].resolve(nil, args, nil)
      expect(Task.count).to eq 4
      expect(Task.last.title).to eq "Some random title"
    end
  end

  describe 'editing a task' do
    let!(:task) { create(:task, title: 'Old title') }

    it 'updates a task' do
      args = {
        id: task.id,
        title: 'I am a new task title'
      }

      query_result = Mutations::TaskMutation.fields['edit_task'].resolve(nil, args, nil)

      expect(query_result.title).to eq(args[:title])
      expect(Task.count).to eq 4
    end
  end

end
