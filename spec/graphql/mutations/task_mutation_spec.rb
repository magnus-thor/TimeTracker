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

    it "increases todo lists by 1" do
      expect(Task.count).to eq 3
      subject.fields["create_task"].resolve(nil, args, nil)
      expect(Task.count).to eq 4
      expect(Task.last.title).to eq "Some random title"
    end
  end
end
