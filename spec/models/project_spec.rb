require "rails_helper"

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    expect(build(:project)).to be_valid
  end

  describe "DB table" do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
  end

  describe "Association" do
    it { is_expected.to have_many :user_projects }
    it { is_expected.to have_many(:users).through(:user_projects) }
  end

end
